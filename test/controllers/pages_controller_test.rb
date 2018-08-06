require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

# Test du comportement de la page d'accueil / Navbar
  test "Homepage déconnecté : lien login et nouvel utilisateur, pas de logout ni de page club" do
    get "/"
    assert_select("a[href=?]", "/login")
    assert_select("a[href=?]", "/users/new")
    assert_no_match("a[href=?]", "/logout")
    assert_no_match("a[href=?]", "/users")
  end


  test "Homepage connecté : lien page club et logout, pas de login et de nouvel utilisateur" do
    post "/users", params: { user: { first_name: "test", last_name: "test", pseudo: "test", email: "test@test.com", password: "test", remember_me: 1 } }
    delete "/logout"
    post "/login", params: { session: { first_name: "test", last_name: "test", pseudo: "test", email: "test@test.com", password: "test", remember_me: 1 } }
    get "/"
    assert_select("a[href=?]", "/logout")
    assert_select("a[href=?]", "/users")
    assert_no_match("a[href=?]", "/login")
    assert_no_match("a[href=?]", "/users/new")
  end

# Test page d'inscription, qui doit évidemment retourner une erreur si la personne n'a pas rentré les bons champs (email en double, paramètre manquant)

  test "Création d'utilisateur avec un champ manquant" do
    post "/users", params: { user: { first_name: "", last_name: "test2", pseudo: "test2", email: "test2@test.com", password: "test2", remember_me: 1 } }
    get "/"
    assert_no_match("a[href=?]", "/logout")
  end


  test "Création d'utilisateur avec un mail déjà existant" do
    post "/users", params: { user: { first_name: "test3", last_name: "test3", pseudo: "test3", email: "test3@test.com", password: "test3", remember_me: 1 } }
    delete "/logout"
    post "/users", params: { user: { first_name: "test4", last_name: "test4", pseudo: "test4", email: "test3@test.com", password: "test4", remember_me: 1 } }
    get "/"
    assert_no_match("a[href=?]", "/logout")
  end


end



# Il faut tester la page de login, qui doit login la personne si elle rentre un bon ID, et lui renvoyer un message d'erreur si elle ne renvoie pas un bon paramètre
# Il faut tester la navbar, qui doit afficher les bons liens
# Il faut tester la page du club, qui ne doit être accessible qu'aux personnes login. La page doit renvoyer la liste des personnes inscrites au site, donc il faut tester cela.


