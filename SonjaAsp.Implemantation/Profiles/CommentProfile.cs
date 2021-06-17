using AutoMapper;
using SonjaAsp.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Profiles
{
    public class CommentProfile : Profile
    {
        public CommentProfile()
        {
            CreateMap<Domain.Comment, CommentDto>();
            CreateMap<CommentDto, Domain.Comment>();
        }
    }
}
