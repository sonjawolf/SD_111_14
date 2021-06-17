
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.DataAccess.Configuration
{
   public class PostConfiguration: IEntityTypeConfiguration<Post>
    {
        public void Configure(EntityTypeBuilder<Post>builder)
        {
            builder.Property(x => x.Title).IsRequired();
            builder.HasIndex(x => x.Title).IsUnique();
            builder.Property(x => x.Text).IsRequired();
            builder.Property(x => x.PostedAt).HasDefaultValue(DateTime.UtcNow);

            builder.HasMany(x => x.Comments)
                .WithOne(x => x.Post)
                .HasForeignKey(x => x.PostId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.Pictures)
                 .WithOne(x => x.Post)
                 .HasForeignKey(x => x.PostId)
                 .OnDelete(DeleteBehavior.Restrict);

        }
    }
}
