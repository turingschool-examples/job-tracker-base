require 'rails_helper'

describe "User visits a job show page" do
  let!(:cool_tag)      { Tag.create!(title: 'cool')}
  let!(:suh_dude)      { Tag.create!(title: 'suh dude')}
  let!(:software)      { Tag.create!(title: 'software')}
  let!(:cool_cool_tag) { Tag.create!(title: 'cool cool')}
  let!(:chic)          { Tag.create!(title: 'chic')}
  let!(:post_noir)     { Tag.create!(title: 'post noir')}
  let!(:artisinal)     { Tag.create!(title: 'artisinal')}

  let!(:mj_emporium)   { Company.create!(name: "Herb Emporium and other such trinkets and delights")}
  let!(:chic_factory)  { Company.create!(name: "chic factory")}
  let!(:tech_town)     { Company.create!(name: "tech disruption, so hot right now")}

  let!(:software_nerd) { tech_town.jobs.create!(title: 'Rails ninja!',  level_of_interest: 10, city: 'NYC', salary: 800000 )}
  let!(:b2bsales)      { tech_town.jobs.create!(title: 'b2b sales!',    level_of_interest: 1,  city: 'NYC', salary: 700000 )}
  let!(:react_dev)     { tech_town.jobs.create!(title: 'Lord of React', level_of_interest: 95, city: 'NYC', salary: 1000000 )}
  let!(:devops)        { tech_town.jobs.create!(title: 'dev ops!',      level_of_interest: 8,  city: 'NYC', salary: 1100000 )}

  let!(:barista)       { chic_factory.jobs.create(title: "barista",        level_of_interest: 20, city: 'LA', salary: 20000)}
  let!(:artisan)       { chic_factory.jobs.create(title: "artisan",        level_of_interest: 20, city: 'LA', salary: 30000)}
  let!(:cooler_than)   { chic_factory.jobs.create(title: "2chich2furious", level_of_interest: 20, city: 'LA', salary: 80000)}

  let!(:horticulture) { mj_emporium.jobs.create!(title: "horticulturalist", level_of_interest: 70, city: "Denver", salary: 20000)}
  let!(:curator)      { mj_emporium.jobs.create!(title: "curator",          level_of_interest: 70, city: "Denver", salary: 30000)}
  let!(:SM_influence) { mj_emporium.jobs.create!(title: "media influencer", level_of_interest: 20, city: "Denver", salary: 40000)}

  scenario "and sees tags associated with specific job" do
    horticulture.tags << cool_tag
    horticulture.tags << suh_dude
    horticulture.tags << cool_cool_tag
    horticulture.tags << artisinal

    visit company_job_path(mj_emporium, horticulture)

    expect(page).to have_content("Herb Emporium and other such trinkets and delights")
    expect(page).to have_content("horticulturalist")
    expect(page).to have_content("70")
    expect(page).to have_content("cool")
    expect(page).to have_content("cool cool")
    expect(page).to have_content("suh dude")
    expect(page).to have_content("artisinal")
  end

  scenario 'and sees a count of how many jobs have each specific tag' do
    software_nerd.tags << post_noir
    software_nerd.tags << artisinal
    software_nerd.tags << chic
    software_nerd.tags << software
    b2bsales.tags      << post_noir
    b2bsales.tags      << software

    visit company_job_path(tech_town, software_nerd)

    expect(page).to have_content("post noir")
    expect(page).to have_content("artisinal")
    expect(page).to have_content("chic")
    expect(page).to have_content("software")

    expect(page).to have_content('software - 2')
    expect(page).to have_content('post noir - 2')
    expect(page).to have_content('artisinal - 1')
    expect(page).to have_content('chic - 1')
  end

  scenario 'and sees an average salary for all jobs within a specific tag' do
    software_nerd.tags << post_noir
    software_nerd.tags << artisinal
    software_nerd.tags << chic
    software_nerd.tags << software
    barista.tags       << post_noir
    barista.tags       << software
    barista.tags       << cool_tag
    barista.tags       << suh_dude
    barista.tags       << cool_cool_tag
    barista.tags       << artisinal
    curator.tags       << cool_tag
    curator.tags       << suh_dude
    curator.tags       << software
    curator.tags       << cool_cool_tag
    curator.tags       << chic
    curator.tags       << post_noir
    curator.tags       << artisinal

    visit company_job_path(chic_factory, software_nerd)

    expect(page).to have_content('software - 3 ($283,333.33)')
    expect(page).to have_content('post noir - 3 ($283,333.33)')
    expect(page).to have_content('artisinal - 3 ($283,333.33)')
    expect(page).to have_content('chic - 2 ($415,000.00)')
  end
end