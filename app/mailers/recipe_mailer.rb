class RecipeMailer < ActionMailer::Base
  default from: 'contact@socialrecipe.com'

  def share_email(user, recipe, email)
    @user = user
    @recipe = recipe
    email_with_name = %("#{@user.name}" <#{@user.email}>)
    mail(from: @user.email, to: email, subject: "Recipe of #{@recipe.name}")
  end
end
