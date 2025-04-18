Profile.destroy_all
Article.destroy_all
Project.destroy_all

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

Article.create!(title: "C'est quoi Internet ?", content: "Coming soon")
Article.create!(title: "Histoire et Evolution de l'Internet", content: "Coming soon")
Article.create!(title: "Comprendre le World Wide Web (WWW)", content: "Coming soon")
Article.create!(title: "Internet vs. Intranet vs. Extranet", content: "Coming soon")

Project.create!(
  title: "My Awesome Website",
  description: "A personal website built with Ruby on Rails.",
  image_url: "https://wallpapers.com/images/high/futuristic-project-management-inbiirodqxwccs7h.webp",
  live_link: "https://wallpapers.com/images/high/futuristic-project-management-inbiirodqxwccs7h.webp",
  source_code_link: "https://github.com/"
)

Project.create!(
  title: "My Awesome Website",
  description: "A personal website built with Ruby on Rails.",
  image_url: "https://upload.wikimedia.org/wikipedia/commons/a/ad/Zero-project_infinity_wallpaper_1920x1080.jpg",
  live_link: "https://upload.wikimedia.org/wikipedia/commons/a/ad/Zero-project_infinity_wallpaper_1920x1080.jpg",
  source_code_link: "https://github.com/"
)
