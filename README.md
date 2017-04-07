# OAuth2/Phoenix Example Application

> This is an example application showing how one can integrate with the
> [OAuth2](https://github.com/scrogson/oauth2) library and
> the [Phoenix](https://github.com/phoenixframework/phoenix) framework.

Supports authorization via:
- GitHub
- Google
- Facebook
- VK

![Alt text](https://github.com/ElusiveSpirit/oauth2_example/blob/master/web/static/assets/images/screenshot.png)

To start the application:

1. Register a new application on [GitHub](https://github.com/settings/applications/new)
    - Enter http://localhost:4000/auth/github/callback for the Authorization callback URL
2. Set the `GITHUB_REDIRECT_URI` environment variable to the callback URL
3. Set the `GITHUB_CLIENT_ID` and `GITHUB_CLIENT_SECRET` environment variables
4. Install Elixir dependencies with `mix deps.get`
5. Install NodeJS dependencies with `npm install`
6. Setup the database with `mix ecto.setup`
7. Start the application with `mix phoenix.server`

Now you can visit `localhost:4000` from your browser and click "Sign in with
GitHub".

After authorizing the application, you should see the welcome message above.
