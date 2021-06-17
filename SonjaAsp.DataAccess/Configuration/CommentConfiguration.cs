using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SonjaAsp.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace SonjaAsp.DataAccess.Configuration
{
    public class CommentConfiguration : IEntityTypeConfiguration<Comment>
    {
        public void Configure(EntityTypeBuilder<Comment> builder)
        {
            builder.Property(x => x.Text).HasMaxLength(160);
            builder.Property(x => x.Text).IsRequired();
        }
    }
}
