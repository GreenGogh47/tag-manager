require "rails_helper"

RSpec.describe Space do
  before(:each) do
    my_space = {:id=>"90090228842",
      :name=>"Personal",
      :color=>"#3498DB",
      :private=>true,
      :avatar=>nil,
      :admin_can_manage=>false,
      :statuses=>
       [{:id=>"p90090228842_u4kv1Iu6", :status=>"Open", :type=>"open", :orderindex=>0, :color=>"#d3d3d3"},
        {:id=>"p90090228842_ed7ZhKIM", :status=>"in progress", :type=>"custom", :orderindex=>1, :color=>"#81B1FF"},
        {:id=>"p90090228842_sgP0Eljz", :status=>"roadblock", :type=>"custom", :orderindex=>2, :color=>"#f9d900"},
        {:id=>"p90090228842_VYrFKFQ1", :status=>"complete", :type=>"closed", :orderindex=>3, :color=>"#6bc950"}],
      :multiple_assignees=>false,
      :features=>
       {:due_dates=>{:enabled=>true, :start_date=>true, :remap_due_dates=>true, :remap_closed_due_date=>false},
        :sprints=>{:enabled=>false},
        :points=>{:enabled=>false},
        :custom_items=>{:enabled=>false},
        :priorities=>
         {:enabled=>true,
          :priorities=>
           [{:color=>"#f50000", :id=>"1", :orderindex=>"1", :priority=>"urgent"},
            {:color=>"#ffcc00", :id=>"2", :orderindex=>"2", :priority=>"high"},
            {:color=>"#6fddff", :id=>"3", :orderindex=>"3", :priority=>"normal"},
            {:color=>"#d8d8d8", :id=>"4", :orderindex=>"4", :priority=>"low"}]},
        :tags=>{:enabled=>true},
        :time_estimates=>{:enabled=>true, :rollup=>false, :per_assignee=>false},
        :check_unresolved=>{:enabled=>true, :subtasks=>nil, :checklists=>nil, :comments=>nil},
        :zoom=>{:enabled=>false},
        :milestones=>{:enabled=>false},
        :custom_fields=>{:enabled=>true},
        :dependency_warning=>{:enabled=>true},
        :status_pies=>{:enabled=>true},
        :emails=>{:enabled=>true}},
      :archived=>false,
      :members=>[{:user=>{:id=>66176739, :username=>"Christopher Crane", :color=>"#d60800", :profilePicture=>"https://attachments.clickup.com/profilePictures/66176739_QbA.jpg", :initials=>"CC"}}]}
      
    @space = Space.new(my_space)
  end

  it "exists" do
    statuses = [{
      :id=>"p90090228842_u4kv1Iu6",
      :status=>"Open",
      :type=>"open",
      :orderindex=>0,
      :color=>"#d3d3d3"
    },
    {
      :id=>"p90090228842_ed7ZhKIM",
      :status=>"in progress",
      :type=>"custom",
      :orderindex=>1,
      :color=>"#81B1FF"
    },
    {
      :id=>"p90090228842_sgP0Eljz",
      :status=>"roadblock",
      :type=>"custom",
      :orderindex=>2,
      :color=>"#f9d900"
    },
    {
      :id=>"p90090228842_VYrFKFQ1",
      :status=>"complete",
      :type=>"closed",
      :orderindex=>3,
      :color=>"#6bc950"
    }]

    expect(@space).to be_a(Space)
    expect(@space.id).to eq("90090228842")
    expect(@space.name).to eq("Personal")
    expect(@space.color).to eq("#3498DB")
    expect(@space.hidden).to eq(true) # private is a reserved word
    expect(@space.statuses).to eq(statuses)
    expect(@space.members).to eq([{:user=>{:id=>66176739, :username=>"Christopher Crane", :color=>"#d60800", :profilePicture=>"https://attachments.clickup.com/profilePictures/66176739_QbA.jpg", :initials=>"CC"}}])
  end

end