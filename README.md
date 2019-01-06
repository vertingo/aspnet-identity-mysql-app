# DotNet(https://cloud.google.com/sdk/)

# Commande Ludown Chat-Bot + Build du robot depuis l'éditeur en ligne

- npm i -g msbot luis-apis ludown (Installation du Gestionnaire Ludown, MSBOT, luis-apis CLI Tools)

- ludown parse toluis --in dialogs/greeting/resources/main.lu -o cognitiveModels/ --out basicBot.luis -n 'basic-bot-LUIS' -d 'Basic bot Bot Builder V4 sample.' --verbose (Génére le model basicBot.luis)

- luis import application --in cognitiveModels/basicBot.luis --appName BasicBot

- msbot list --secret 2u0uzNwhEyR/Ic5ZQl07fzdyIP0MwOHqYbHc5cHJDlc=

- luis train version --appId 274de992-a1ab-4c0d-9e90-8b474edc5913 --versionId 0.1 [--wait]


# Creation d'un projet Web-Api + test avec Postman


## [Visual Studio](#tab/visual-studio)

* From the **File** menu, select **New** > **Project**.
* Select the **ASP.NET Core Web Application** template. Name the project *TodoApi* and click **OK**.
* In the **New ASP.NET Core Web Application - TodoApi** dialog, choose the ASP.NET Core version. Select the **API** template and click **OK**. Do **not** select **Enable Docker Support**.

Changer de répertoire avec cd et exécuter la commande suivante:

- console dotnet new webapi -o TodoApi code -r TodoApi

# Test the API

The project template creates a `values` API. Call the `Get` method from a browser to test the app.

## [Visual Studio](#tab/visual-studio)

Press Ctrl+F5 to run the app. Visual Studio launches a browser and navigates to `https://localhost:<port>/api/values`, where `<port>` is a randomly chosen port number.

If you get a dialog box that asks if you should trust the IIS Express certificate, select **Yes**. In the **Security Warning** dialog that appears next, select **Yes**.

## Add a model class

* In **Solution Explorer**, right-click the project. Select **Add** > **New Folder**. Name the folder *Models*.

* Right-click the *Models* folder and select **Add** > **Class**. Name the class *TodoItem* and select **Add**.

* Replace the template code with the following code:

[!code-csharp[](first-web-api/samples/2.2/TodoApi/Models/TodoItem.cs)]

## Add a database context

* Right-click the *Models* folder and select **Add** > **Class**. Name the class *TodoContext* and click **Add**.

* Replace the template code with the following code:

[!code-csharp[](first-web-api/samples/2.2/TodoApi/Models/TodoContext.cs)]

## Register the database context

Update *Startup.cs* with the following highlighted code:

[!code-csharp[](first-web-api/samples/2.2/TodoApi/Startup1.cs?highlight=5,8,25-26&name=snippet_all)]

## Add a controller

* Right-click the *Controllers* folder.
* Select **Add** > **New Item**.
* In the **Add New Item** dialog, select the **API Controller Class** template.
* Name the class *TodoController*, and select **Add**


* Replace the template code with the following code:

  [!code-csharp[](first-web-api/samples/2.2/TodoApi/Controllers/TodoController2.cs?name=snippet_todo1)]
  
## Add Get methods

To provide an API that retrieves to-do items, add the following methods to the `TodoController` class:

[!code-csharp[](first-web-api/samples/2.2/TodoApi/Controllers/TodoController.cs?name=snippet_GetAll)]

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

- dotnet ef database update


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


- Dans le projet IdentityMySQLDemo, remplacez toutes les références à
    `using Microsoft.AspNet.Identity.EntityFramework;`
   avec
     `using AspNet.Identity.MySQL;`        (Dans IdentityConfig.cs et IdentityModel.cs)




- Dans IdentityModels.cs, définissez **ApplicationDbContext** pour qu'il dérive de **MySqlDatabase** et incluez un constructeur qui accepte un seul paramètre avec le nom de la connexion. Code ci-dessous


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


- Ouvrez le fichier IdentityConfig.cs. Dans la méthode ** ApplicationUserManager.Create **, remplacez l'instanciation UserManager par le code suivant:

var manager = new ApplicationUserManager(
    new UserStore<ApplicationUser>(
    context.Get<ApplicationDbContext>() as MySQLDatabase));

- Ouvrez le fichier web.config et remplacez la chaîne DefaultConnection par cette entrée en remplaçant les valeurs en surbrillance par la chaîne de connexion de la base de données MySQL créée aux étapes précédentes.

<add name="DefaultConnection" connectionString="Database=IdentityMySQLDatabase;Data Source=127.0 0.1;User Id=root;Password=root" providerName="MySql.Data.MySqlClient" />

## Exécutez l'application et connectez-vous à la base de données MySQL

Cliquez avec le bouton droit sur le projet ** IdentityMySQLDemo ** et sélectionnez ** Définir comme projet de démarrage **.

Appuyez sur ** Ctrl + F5 ** pour créer et exécuter l'application.

Cliquez sur l'onglet ** S'inscrire ** en haut de la page.

Entrez un nouveau nom d'utilisateur et mot de passe puis cliquez sur ** Enregistrer **

Le nouvel utilisateur est maintenant enregistré et connecté

Retournez dans l'outil MySQL Workbench et examinez le contenu de la table ** IdentityMySQLDatabase **. Inspectez le tableau des utilisateurs pour les entrées lorsque vous enregistrez de nouveaux utilisateurs

# English Version
Sample project for the article http://www.asp.net/identity/overview/extensibility/implementing-a-custom-mysql-aspnet-identity-storage-provider 


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

	var manager = new ApplicationUserManager(new UserStore<ApplicationUser>(context.Get<ApplicationDbContext>() as MySQLDatabase));

- If any properties are added to the ApplicationUser class, then update the Insert, GetUserByName, GetUserById and Update methods in AspNet.Identity.MySQL project

# Démo du projet Web-Api

Test du projet WebApiSample et requêtage dans PostMan

# SignalR

```
Un petit coup de pouce suivez nous sur YouTube et Facebook!
[You Tube] ==> https://www.youtube.com/channel/UC2g_-ipVjit6ZlACPWG4JvA?sub_confirmation=1 
[Facebook] ==> https://www.facebook.com/vertingo/ 
```
