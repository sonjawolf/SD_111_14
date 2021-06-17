using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using SonjaAsp.Application;
using SonjaAsp.Application.Commands;
using SonjaAsp.Application.Queries;
using SonjaAsp.Implemantation.Commands;
using SonjaAsp.Implemantation.Queries;
using SonjaAsp.Implemantation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SonjaAsp.Api.Core
{
    public static class ContainerExtension
    {
        public static void AddUseCases(this IServiceCollection services)
        {
            
            //category
            services.AddTransient<ICreateCategoryCommand, EfCreateCategoryCommand>();
            services.AddTransient<IDeleteCategoryCommand, EfDeleteCategoryCommand>();
            services.AddTransient<IGetCategoryQuery, EfGetCategoryQuery>();
            services.AddTransient<IGetOneCategoryQuery, EfGetOneCategoryQuery>();

            //users
            services.AddTransient<IDeleteUserCommand, EfDeleteUserCommand>();
            services.AddTransient<IGetUserQuery, EfGetUserQuery>();
            services.AddTransient<IGetOneUserQuery, EfGetOneUserQuery>();
            services.AddTransient<IUpdateUserCommand, EfUpdateUserCommand>();

            //posts
            services.AddTransient<ICreatePostCommand, EfCreatePostCommand>();
            services.AddTransient<IDeletePostCommand, EfDeletePostCommand>();
            services.AddTransient<IGetPostQuery, EfGetPostQuery>();
            services.AddTransient<IGetOnePostQuery, EfGetOnePostQuery>();
            services.AddTransient<IUpdatePostCommand, EfUpdatePostCommand>();

            //comments
            services.AddTransient<ICreateCommentCommand, EfCreateCommentCommand>();
            services.AddTransient<IDeleteCommentCommand, EfDeleteCommentCommand>();
            services.AddTransient<IUpdateCommentCommand, EfUpdateCommentCommand>();
            services.AddTransient<IGetCommentQuery, EfGetCommentQuery>();

            //pictures
            services.AddTransient<ICreatePictureCommand, EfCreatePictureCommand>();
            services.AddTransient<IDeletePictureCommand, EfDeletePictureCommand>();
            services.AddTransient<IGetPictureQuery, EfGetPictureQuery>();

            //logger
            services.AddTransient<IGetUseCaseLogQuery, EfGetUseCaseLogQuery>();

            //userusecase
            services.AddTransient<ICreateUserUseCase, EfCreateUserUseCase>();
            services.AddTransient<IDeleteUserUseCaseCommand, EfDeleteUserUseCaseCommand>();
            
            services.AddTransient<UseCaseExecutor>();
            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<CreateCategoryValidator>();
            services.AddTransient<CreatePostValidator>();
            services.AddTransient<CommentValidator>();


        }
        public static void AddApplicationActor(this IServiceCollection services)
        {
            services.AddTransient<IAplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();

                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    return new AnonymousActor();
                }
                
                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;

            });
        }

    }
}
