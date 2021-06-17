using AutoMapper;
using SonjaAsp.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Profiles
{
    public class PostProfile : Profile
    {
        public PostProfile()
        {
            CreateMap<Domain.Post, PostDto>();
            CreateMap<PostDto, Domain.Post>();
        }
    }
}
