using AutoMapper;
using SonjaAsp.Application.DataTransfer;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.Implemantation.Profiles
{
  public class CategoryProfile:Profile
    {
        public CategoryProfile()
        {
            CreateMap<Domain.Category, CategoryDto>();
            CreateMap<CategoryDto,Domain.Category > ();
        }
      
    }
}
