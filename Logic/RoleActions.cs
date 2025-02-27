﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Projekat.Models;

namespace Projekat.Logic
{
    public class RoleActions
    {
        internal void AddUserAndRole()
        {
            Models.ApplicationDbContext context = new ApplicationDbContext();
            IdentityResult IdRoleResult;
            IdentityResult IdUserResult;

            // Create a RoleStore object by using the ApplicationDbContext object. 
            // The RoleStore is only allowed to contain IdentityRole objects.
            var roleStore = new RoleStore<IdentityRole>(context);

            // Create a RoleManager object that is only allowed to contain IdentityRole objects.
            // When creating the RoleManager object, you pass in (as a parameter) a new RoleStore object. 
            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            // Then, you create the "canEdit" role if it doesn't already exist.
            if (!roleMgr.RoleExists("canEdit"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "canEdit" });
            }

            // Create a UserManager object based on the UserStore object and the ApplicationDbContext  
            // object. Note that you can create new objects and use them as parameters in
            // a single line of code, rather than using multiple lines of code, as you did
            // for the RoleManager object.
            var userMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            var appUser = new ApplicationUser
            {
                UserName = "admin@metalpedia.com",
                Email = "admin@metalpedia.com"
            };
            IdUserResult = userMgr.Create(appUser, "Admin1!");

            // If the new "canEdit" user was successfully created, 
            // add the "canEdit" user to the "canEdit" role. 
            if (!userMgr.IsInRole(userMgr.FindByEmail("admin@metalpedia.com").Id, "canEdit"))
            {
                IdUserResult = userMgr.AddToRole(userMgr.FindByEmail("admin@metalpedia.com").Id, "canEdit");
            }
        }
    }
}