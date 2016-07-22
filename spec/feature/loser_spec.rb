feature 'loser' do
  scenario 'player dies if Hps are 0' do
    sign_in_and_play
    10.times{multiple_attacks}
    click_button 'Attack'
    expect(page).to have_content "dead"
  end
end
