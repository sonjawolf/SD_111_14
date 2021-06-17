using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.DataAccess.Configuration
{
    public class CategoryConfiguration : IEntityTypeConfiguration<Category>
    {
        public void Configure(EntityTypeBuilder<Category> builder)
        {
            builder.Property(x => x.CategoryName).HasMaxLength(30);
            builder.HasIndex(x => x.CategoryName).IsUnique();
            builder.Property(x => x.CategoryName).IsRequired();

            builder.HasMany(x => x.Posts)
                .WithOne(x => x.Category)
                .HasForeignKey(x=>x.CategoryId)
                .OnDelete(DeleteBehavior.Restrict);

        }
    }
    
}
