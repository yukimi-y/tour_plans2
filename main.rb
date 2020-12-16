plans = [
  { place: "沖縄", price: 10000 },
  { place: "北海道", price: 20000 },
  { place: "九州", price: 15000 }
]

def disp_plan(plans)
  puts "旅行プランを選択して下さい。" 
  plans.each.with_index(1) do |plan, i|
    puts "#{i}.#{plan[:place]}(#{plan[:price]}円)"
  end
end

def choose_plan(plans)
  while true
    print "プランの番号を選択 > "
    selected_plan_num = gets.to_i
    break if (1..3).include?(selected_plan_num)
    puts "1~3の番号を入力してください"
  end
plans[selected_plan_num - 1]
end

def decide_num_of_people(chosen_plan)
  puts "#{chosen_plan[:name]}ですね。何名で予約されますか？"
  while true
    print "人数を入力 > "
    num_of_people = gets.to_i
    break if num_of_people >= 1
    puts "1以上を入力してください"
  end
  num_of_people

end

def calculate_fee(chosen_plan, num_of_people)
  puts "#{num_of_people}名ですね。"
  total_price = chosen_plan[:price] * num_of_people
  if num_of_people >= 5
    puts "5名以上ですので10%割引となります。"
    total_price *= 0.9
  end
  puts "合計料金は#{total_price.floor}円になります。"
end

disp_plan(plans)
chosen_plan = choose_plan(plans)
num_of_people = decide_num_of_people(chosen_plan)
calculate_fee(chosen_plan, num_of_people)