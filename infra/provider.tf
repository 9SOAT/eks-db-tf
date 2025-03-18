provider "aws" {
  region     = us-east-1
  access_key = ${{ secrets.AWS_ACCESS_KEY_ID }}  # Use variáveis ou um gerenciador de segredos
  secret_key = ${{ secrets.AWS_SECRET_ACCESS_KEY }}  # Use variáveis ou um gerenciador de segredos
}
