PROJECT="template"
OWNER="uhlig"
dotnet new sln -n $PROJECT

mkdir src
cd src
dotnet new webapi -n application -o "$OWNER.$PROJECT.Application" 

dotnet new classlib -n domain -o "$OWNER.$PROJECT.Domain"

dotnet new classlib -n service -o "$OWNER.$PROJECT.Service"

dotnet new classlib -n infra.Data -o "$OWNER.$PROJECT.Infra.Data"

dotnet new classlib -n infra.CrossCutting -o "$OWNER.$PROJECT.Infra.CrossCutting"

cd ..
dotnet sln add "src/$OWNER.$PROJECT.Application/"
dotnet sln add "src/$OWNER.$PROJECT.Domain/"
dotnet sln add "src/$OWNER.$PROJECT.Service/"
dotnet sln add "src/$OWNER.$PROJECT.Infra.Data/"
dotnet sln add "src/$OWNER.$PROJECT.Infra.CrossCutting/"

dotnet add "src/$OWNER.$PROJECT.Application/" reference "src/$OWNER.$PROJECT.Domain/"
dotnet add "src/$OWNER.$PROJECT.Application/" reference "src/$OWNER.$PROJECT.Service/"
dotnet add "src/$OWNER.$PROJECT.Service/" reference "src/$OWNER.$PROJECT.Infra.Data/"
dotnet add "src/$OWNER.$PROJECT.Service/" reference "src/$OWNER.$PROJECT.Domain/"
dotnet add "src/$OWNER.$PROJECT.Infra.Data/" reference "src/$OWNER.$PROJECT.Domain/" 

dotnet add "src/$OWNER.$PROJECT.Infra.CrossCutting/" reference "src/$OWNER.$PROJECT.Domain/" 
dotnet add "src/$OWNER.$PROJECT.Infra.CrossCutting/" reference "src/$OWNER.$PROJECT.Service/" 
dotnet add "src/$OWNER.$PROJECT.Infra.CrossCutting/" reference "src/$OWNER.$PROJECT.Infra.Data/" 
dotnet add "src/$OWNER.$PROJECT.Application/" reference "src/$OWNER.$PROJECT.Infra.CrossCutting/" 