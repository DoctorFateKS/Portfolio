Profile.find_or_create_by(name: "Kevin Saison") do |profile|
  profile.title = "Ruby on Rails Développeur"
  profile.bio = "GUM GUMMMMMMM... RAILSSSSS !!!!!!!!!!!!!"
  profile.skills = ["Ruby", "Rails", "Javascript"]
  profile.social_links = {
    "github" => "https://github.com/DoctorFateKS",
    "linkedin" => "https://www.linkedin.com/in/kevin-saison-25875317b/"
  }
  profile.save!
end

puts "Profil par défaut créé"
