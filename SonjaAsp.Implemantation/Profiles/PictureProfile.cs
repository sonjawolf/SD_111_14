using AutoMapper;
using SonjaAsp.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Profiles
{
    public class PictureProfile : Profile
    {
        public PictureProfile()
        {
            CreateMap<Domain.Picture, PictureDto>();
            CreateMap<PictureDto, Domain.Picture>();
        }
    }
}
