using FluentValidation;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using SonjaAsp.Application.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace SonjaAsp.Api.Core
{
    public class GlobalExceptionHandler
    {
        private readonly RequestDelegate _next;

        public GlobalExceptionHandler(RequestDelegate next)
        {
            _next = next;
        }

        public async Task Invoke(HttpContext httpContext)
        {
            try
            {
                await _next(httpContext);
            }
            catch (Exception ex)
            {
                httpContext.Response.ContentType = "application/json";
                object response = null;
                var statusCode = StatusCodes.Status500InternalServerError;

                switch (ex)
                {
                    case UnauthorizedUseCaseException _:
                        statusCode = StatusCodes.Status403Forbidden;
                        response = new
                        {
                            message = "Nemate dozvolu za ovu operaciju."
                        };
                        break;

                    case EntityNotFoundException _:
                        statusCode = StatusCodes.Status404NotFound;
                        response = new
                        {
                            message = "Trazeni podatak nije pronadjen"
                        };
                        break;

                    case ValidationException validationException:
                        statusCode = StatusCodes.Status422UnprocessableEntity;
                        response = new
                        {
                            message = "Greska prilikom validacije.",
                            errors = validationException.Errors.Select(x => new
                            {
                                x.PropertyName,
                                x.ErrorMessage
                            })
                        };
                        break;
                }

                httpContext.Response.StatusCode = statusCode;

                if (response != null)
                {
                    await httpContext.Response.WriteAsync(JsonConvert.SerializeObject(response));
                    return;
                }

                await Task.FromResult(httpContext.Response);
            }
        }

    }
}
