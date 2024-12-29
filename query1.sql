To transmit a file to a Git repository, you can follow these steps:

1. Navigate to your repository directory:
    ```sh
    cd /Users/larswiesner_/Documents/GitHub/Covid19-Datenbankenprojekt
    ```

2. Add the file to the staging area:
    ```sh
    git add query1.sql
    ```

3. Commit the file with a message:
    ```sh
    git commit -m "Add query1.sql"
    ```

4. Push the changes to the remote repository:
    ```sh
    git push origin main
    ```

Make sure to replace `main` with the appropriate branch name if you are using a different branch.