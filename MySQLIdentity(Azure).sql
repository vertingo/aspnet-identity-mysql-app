CREATE TABLE "roles" (
  "Id" varchar(128) NOT NULL,
  "Name" varchar(256) NOT NULL,
  PRIMARY KEY ("Id")
);

CREATE TABLE "users" (
  "Id" varchar(128) NOT NULL,
  "Email" varchar(256) DEFAULT NULL,
  "EmailConfirmed" tinyint NOT NULL,
  "PasswordHash" varchar(128),
  "SecurityStamp" varchar(128),
  "PhoneNumber" varchar(128),
  "PhoneNumberConfirmed" tinyint NOT NULL,
  "TwoFactorEnabled" tinyint NOT NULL,
  "LockoutEndDateUtc" datetime DEFAULT NULL,
  "LockoutEnabled" tinyint NOT NULL,
  "AccessFailedCount" int NOT NULL,
  "UserName" varchar(256) NOT NULL,
  PRIMARY KEY ("Id")
);




CREATE TABLE "userclaims" (
  "Id" int NOT NULL IDENTITY(1, 1),
  "UserId" varchar(128) NOT NULL,
  "ClaimType" varchar(128),
  "ClaimValue" varchar(128),
  PRIMARY KEY ("Id"),
  CONSTRAINT "ApplicationUser_Claims" FOREIGN KEY ("UserId") REFERENCES "users" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE "userlogins" (
  "LoginProvider" varchar(128) NOT NULL,
  "ProviderKey" varchar(128) NOT NULL,
  "UserId" varchar(128) NOT NULL,
  PRIMARY KEY ("LoginProvider","ProviderKey","UserId"),
  KEY "ApplicationUser_Logins" ("UserId"),
  CONSTRAINT "ApplicationUser_Logins" FOREIGN KEY ("UserId") REFERENCES "users" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE "userroles" (
  "UserId" varchar(128) NOT NULL,
  "RoleId" varchar(128) NOT NULL,
  PRIMARY KEY ("UserId","RoleId"),
  KEY "IdentityRole_Users" ("RoleId"),
  CONSTRAINT "ApplicationUser_Roles" FOREIGN KEY ("UserId") REFERENCES "users" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT "IdentityRole_Users" FOREIGN KEY ("RoleId") REFERENCES "roles" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
) ;
