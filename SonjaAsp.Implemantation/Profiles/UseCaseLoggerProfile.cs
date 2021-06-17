using AutoMapper;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Profiles
{
    public class UseCaseLoggerProfile : Profile
    {
        public UseCaseLoggerProfile()
        {

            CreateMap<Domain.UseCaseLog, UseCaseLogDto>();
        }
    }
}
