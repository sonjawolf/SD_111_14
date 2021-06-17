using AutoMapper;
using SonjaAsp.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Profiles
{
    public class UserProfile : Profile

    {
        public UserProfile()
        {
            CreateMap<Domain.User, RegisterUserDto>();
            CreateMap<RegisterUserDto, Domain.User>();
        }
    }
}
