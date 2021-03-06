﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using StudentSystem.Data;

namespace StudentSystem.Data.Migrations
{
    [DbContext(typeof(StudentSystemDbContext))]
    [Migration("20191105204420_StudentsAdded")]
    partial class StudentsAdded
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.1.0-rtm-30799")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("StudentSystem.Data.Student", b =>
                {
                    b.Property<int>("StudentId")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime?>("Birthday");

                    b.Property<string>("PhoneNumber");

                    b.Property<DateTime>("RegisteredOn");

                    b.HasKey("StudentId");

                    b.ToTable("Students");
                });

            modelBuilder.Entity("StudentSystem.Data.Student", b =>
                {
                    b.OwnsOne("StudentSystem.Data.PersonName", "Name", b1 =>
                        {
                            b1.Property<int?>("StudentId")
                                .ValueGeneratedOnAdd()
                                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                            b1.Property<string>("FirstName")
                                .IsRequired()
                                .HasColumnName("FirstName");

                            b1.Property<string>("LastName")
                                .IsRequired()
                                .HasColumnName("LastName");

                            b1.ToTable("Students");

                            b1.HasOne("StudentSystem.Data.Student")
                                .WithOne("Name")
                                .HasForeignKey("StudentSystem.Data.PersonName", "StudentId")
                                .OnDelete(DeleteBehavior.Cascade);
                        });
                });
#pragma warning restore 612, 618
        }
    }
}
