![Image](https://raw.githubusercontent.com/vertingo/Easy_Admin_YouTube_Newsletter_Firebase/master/web/assets/images/github/vertin_go_website.jpg)
### ?? Apporter votre soutien au projet :heart: pour de futures évolutions!
[![GitHub stars](https://img.shields.io/github/stars/vertingo/screenshott.svg?style=social&label=Star)](https://github.com/vertingo/AspNet_Identity_MySQL) [![GitHub forks](https://img.shields.io/github/forks/vertingo/screenshott.svg?style=social&label=Fork)](https://github.com/vertingo/AspNet_Identity_MySQL/fork) [![GitHub watchers](https://img.shields.io/github/watchers/vertingo/screenshott.svg?style=social&label=Watch)](https://github.com/vertingo/AspNet_Identity_MySQL) [![GitHub followers](https://img.shields.io/github/followers/vertingo.svg?style=social&label=Follow)](https://github.com/vertingo)
[![Twitter Follow](https://img.shields.io/twitter/follow/Vertin_Go.svg?style=social)](https://twitter.com/Vertin_Go)
[![Facebook](https://img.shields.io/badge/Facebook-vertingo-blue?style=social&logo=facebook)](https://www.facebook.com/vertingo)
[![YouTube Subscribe](https://img.shields.io/youtube/channel/subscribers/UC2g_-ipVjit6ZlACPWG4JvA?style=social)](https://www.youtube.com/channel/UC2g_-ipVjit6ZlACPWG4JvA?sub_confirmation=1)

# 🌐 Projet Front-Back End MultiEnv Stack Docker
![App Progress Status](https://img.shields.io/badge/Status-Finished-0520b7.svg?style=plastic)
[![Download](https://img.shields.io/badge/Download-Repo-brightgreen)](https://github.com/vertingo/aspnet-identity-mysql-app/archive/refs/heads/main.zip)

<!-- BEGIN LATEST DOWNLOAD BUTTON -->
[![Download zip](https://custom-icon-badges.demolab.com/badge/-Download-blue?style=for-the-badge&logo=download&logoColor=white "Download zip")](https://github.com/vertingo/aspnet-identity-mysql-app/archive/1.0.2.zip)
<!-- END LATEST DOWNLOAD BUTTON -->

# DotNet(https://visualstudio.microsoft.com/fr/downloads/)

# Creation d'une App MVC + implementer un espace de stockage personnalisé sur Azure(Persistance sans Entity FrameWork)

- Créer une base de donnée MySql sur Azure: IdentityMySQLDatabase

- Pour s'y connecter depuis l'interface en local récupérer le SGBD suivant: https://dev.mysql.com/downloads/windows/installer/

- Ensuite il faut télécharger le storage provider à l'url suivante il nous sera utile pour la suite:(https://aspnet.codeplex.com/SourceControl/latest#Samples/Identity/AspNet.Identity.MySQL/).

- Copiez le contenu du fichier MySQLIdentity.sql contenu l'emplacement suivant:  C:\Users\nom_user\source\repos\aspnet\sourceCode\aspnet\Samples\Identity\AspNet.Identity.MySQL

  coller son contenu dans la requête et exécuter la requête afin de créer la base de donnée sur Azure!

- Ouvrer le projet C:\Users\nom_user\source\repos\aspnet\sourceCode\aspnet\Samples\Identity\AspNet.Identity.MySQL et builder le!

- Maintenant il faut créer le modèle d'application MVC pour cela clique-droit sur **AspNet.Identity.MySQL** et **ajouter**, **new project**

- Dans la boite de dialogue **Add New Project** selectionner **Visual C#** puis **Web** et enfin **ASP.NET Web Application** 

- Appeler votre projet **IdentityMySQLDemo**. Dans la boite de dialogue de votre **New ASP.NET Project** selectionner le MVC template avec les options

  par défauts (qui inclut **Individual User Accounts** comme méthode d'authentification) et cliquer **OK**

- Cliquez avec le bouton droit de la souris sur votre projet IdentityMySQLDemo et sélectionner **Gérer les packages NuGet**.

- Dans la boîte de dialogue de recherche, tapez **Identity.EntityFramework**. Sélectionnez ce package dans la liste des résultats et cliquez sur **Désinstaller**.

- Vous serez invité à désinstaller le package de dépendance EntityFramework. Cliquez sur Oui car nous ne ferons plus ce paquet sur cette application.

- Cliquez avec le bouton droit sur le projet IdentityMySQLDemo, sélectionnez **Ajouter**, **Référence, Solution, Projets;** sélectionner le projet AspNet.Identity.MySQL et cliquez sur **OK**.


- Dans le projet IdentityMySQLDemo, remplacez toutes les références à(Dans IdentityConfig.cs et IdentityModel.cs):
    `using Microsoft.AspNet.Identity.EntityFramework;`
   avec
    `using AspNet.Identity.MySQL;`        


- Dans IdentityModels.cs, définissez **ApplicationDbContext** pour qu'il dérive de **MySqlDatabase** et incluez un constructeur qui accepte un seul paramètre avec le nom de la connexion. Code ci-dessous

```
public class ApplicationDbContext : MySQLDatabase
{
    public ApplicationDbContext(string connectionName)
        : base(connectionName)
    {
    }

    public static ApplicationDbContext Create()
    {
        return new ApplicationDbContext("DefaultConnection");
    }
}
```

- Ouvrez le fichier IdentityConfig.cs. Dans la méthode **ApplicationUserManager.Create**, remplacez l'instanciation UserManager par le code suivant:

```
var manager = new ApplicationUserManager(
    new UserStore<ApplicationUser>(
    context.Get<ApplicationDbContext>() as MySQLDatabase));
```

- Ouvrez le fichier web.config et remplacez la chaîne DefaultConnection par cette entrée en remplaçant les valeurs en surbrillance par la chaîne de connexion de la base de données MySQL créée aux étapes précédentes.

<add name="DefaultConnection" connectionString="Database=IdentityMySQLDatabase;Data Source=127.0 0.1;User Id=root;Password=root" providerName="MySql.Data.MySqlClient" />


## Exécutez l'application et connectez-vous à la base de données MySQL

- Cliquez avec le bouton droit sur le projet **IdentityMySQLDemo** et sélectionnez **Définir comme projet de démarrage**.

- Appuyez sur **Ctrl + F5** pour créer et exécuter l'application.

- Cliquez sur l'onglet **S'inscrire** en haut de la page.

- Entrez un nouveau nom d'utilisateur et mot de passe puis cliquez sur **Enregistrer**

- Le nouvel utilisateur est maintenant enregistré et connecté

- Retournez dans l'outil MySQL Workbench et examinez le contenu de la table **IdentityMySQLDatabase**. Inspectez le tableau des utilisateurs pour les entrées lorsque vous enregistrez de nouveaux utilisateurs


# English Version
Sample project for this section http://www.asp.net/identity/overview/extensibility/implementing-a-custom-mysql-aspnet-identity-storage-provider 


This is an example to implement a MYSQL store for ASP.NET Identity updated to use ASP.NET Identity 2.0

Steps to run project

- Clone repo and open project in VS with Update 2 installed
- Build project to restore packages and build project
- In the solution, add a new one ASP.NET project with MVC and Individual Authentication
- Uninstall Microsoft.AspNet.Identity.EntityFramework package from the web application
- Update connection string to use the MySQL database as needed
- In the IdentityModel.cs, let ApplicationUser class extend from Identity user in AspNet.Identity.MySQL
- ApplicationDbContext extend from MySqlDatabase and the contructor take a single parameter with the connectionstring name
- In the ApplicationManager.Create method, replace instantiating UserManager as shown below

```
	var manager = new ApplicationUserManager(new UserStore<ApplicationUser>(context.Get<ApplicationDbContext>() as MySQLDatabase));
```

- If any properties are added to the ApplicationUser class, then update the Insert, GetUserByName, GetUserById and Update methods in AspNet.Identity.MySQL project


<p align="center">
  <a href="https://www.youtube.com/channel/UC2g_-ipVjit6ZlACPWG4JvA?sub_confirmation=1"><img src="https://platform-media.herokuapp.com/assets/images/reseaux-sociaux/youtube2.png" width="400" height="250"/></a>
  <a href="https://www.facebook.com/vertingo/"><img src="https://platform-media.herokuapp.com/assets/images/reseaux-sociaux/rejoins_nous.png" width="400" height="250"/></a>
</p>


# Creation d'un projet Web-Api + test avec Postman


## [Visual Studio](#tab/visual-studio)


* From the **File** menu, select **New** > **Project**.
* Select the **ASP.NET Core Web Application** template. Name the project *TodoApi* and click **OK**.
* In the **New ASP.NET Core Web Application - TodoApi** dialog, choose the ASP.NET Core version. Select the **API** template and click **OK**. Do **not** select **Enable Docker Support**.

Changer de répertoire avec cd et exécuter la commande suivante:

```
dotnet new webapi -o TodoApi --force
```

## Test the API


The project template creates a `values` API. Call the `Get` method from a browser to test the app.


## [Visual Studio](#tab/visual-studio)


Press Ctrl+F5 to run the app. Visual Studio launches a browser and navigates to `https://localhost:<port>/api/values`, where `<port>` is a randomly chosen port number.

If you get a dialog box that asks if you should trust the IIS Express certificate, select **Yes**. In the **Security Warning** dialog that appears next, select **Yes**.


## Add a model class

* In **Solution Explorer**, right-click the project. Select **Add** > **New Folder**. Name the folder *Models*.

* Right-click the *Models* folder and select **Add** > **Class**. Name the class *TodoItem* and select **Add**.

* Replace the template code with the following code:

```
namespace TodoApi.Models
{
    public class TodoItem
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public bool IsComplete { get; set; }
    }
}

```

## Add a database context

* Right-click the *Models* folder and select **Add** > **Class**. Name the class *TodoContext* and click **Add**.

* Replace the template code with the following code:


```
using Microsoft.EntityFrameworkCore;

namespace TodoApi.Models
{
    public class TodoContext : DbContext
    {
        public TodoContext(DbContextOptions<TodoContext> options)
            : base(options)
        {
        }

        public DbSet<TodoItem> TodoItems { get; set; }
    }
}

```

## Register the database context

Update *Startup.cs* with the following highlighted code:

```
// Unused usings removed
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TodoApi.Models;

namespace TodoAp
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the 
        //container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<TodoContext>(opt =>
                opt.UseInMemoryDatabase("TodoList"));
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP 
        //request pipeline.
#region snippet_configure
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                // The default HSTS value is 30 days. You may want to change this for 
                // production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseMvc();
        }
#endregion
    }
}
```

## Add a controller

* Right-click the *Controllers* folder.
* Select **Add** > **New Item**.
* In the **Add New Item** dialog, select the **API Controller Class** template.
* Name the class *TodoController*, and select **Add**

* Replace the template code with the following code:

```
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TodoApi.Models;

#region TodoController
namespace TodoApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TodoController : ControllerBase
    {
        private readonly TodoContext _context;
        #endregion

        public TodoController(TodoContext context)
        {
            _context = context;

            if (_context.TodoItems.Count() == 0)
            {
                // Create a new TodoItem if collection is empty,
                // which means you can't delete all TodoItems.
                _context.TodoItems.Add(new TodoItem { Name = "Item1" });
                _context.SaveChanges();
            }
        }
    }
}

```
  
## Add Get methods

To provide an API that retrieves to-do items, add the following methods to the `TodoController` class:

```
// GET: api/Todo
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TodoItem>>> GetTodoItems()
        {
            return await _context.TodoItems.ToListAsync();
        }

        // GET: api/Todo/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TodoItem>> GetTodoItem(long id)
        {
            var todoItem = await _context.TodoItems.FindAsync(id);

            if (todoItem == null)
            {
                return NotFound();
            }

            return todoItem;
        }

```

These methods implement two GET endpoints:

* `GET /api/todo`
* `GET /api/todo/{id}`

Test the app by calling the two endpoints from a browser. For example:

* `https://localhost:<port>/api/todo`
* `https://localhost:<port>/api/todo/1`

The following HTTP response is produced by the call to `GetTodoItems`:

```json
[
  {
    "id": 1,
    "name": "Item1",
    "isComplete": false
  }
]
```


## Test the GetTodoItems method

This tutorial uses Postman to test the web API.

* Install [Postman](https://www.getpostman.com/apps)
* Start the web app.
* Start Postman.
* Disable **SSL certificate verification**
  
  * From  **File > Settings** (**General* tab), disable **SSL certificate verification**.
    > [!WARNING]
    > Re-enable SSL certificate verification after testing the controller.

* Create a new request.
  * Set the HTTP method to **GET**.
  * Set the request URL to `https://localhost:<port>/api/todo`. For example, `https://localhost:5001/api/todo`.
* Set **Two pane view** in Postman.
* Select **Send**.

![Postman with Get request](first-web-api/_static/2pv.png)


# CU EntityFramework (Persistance avec EntityFramework)

Récuperer le contenu du repository GitHub suivant: https://github.com/aspnet/ApiDocs

Executer le script .openpublishing.build dans une invite de commande PowerShell situé à la racine dans le dossier ApiDocs-master:

Ouvrez le projet situé à l'emplacement suivant dans Visual Studio 2017(Docs-master\aspnetcore\data\ef-mvc\intro\samples\cu-final)

Taper ensuite la commande suivante pour initialiser la base de donnée avec Entity FrameWork!


```
- dotnet ef database update
```

# Démo du projet Web-Api


Test du projet WebApiSample et requêtage dans PostMan

# SignalR

<p align="center">
  <a href="https://www.youtube.com/channel/UC2g_-ipVjit6ZlACPWG4JvA?sub_confirmation=1"><img src="https://platform-media.herokuapp.com/assets/images/reseaux-sociaux/youtube2.png" width="400" height="250"/></a>
  <a href="https://www.facebook.com/vertingo/"><img src="https://platform-media.herokuapp.com/assets/images/reseaux-sociaux/rejoins_nous.png" width="400" height="250"/></a>
</p>
