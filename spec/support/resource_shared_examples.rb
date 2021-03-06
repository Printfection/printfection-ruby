RSpec.shared_examples "Resource" do
  it "inherits from Resource" do
    expect(described_class.ancestors).to include Printfection::Resource
  end
end

RSpec.shared_examples "Actions::Retrieve" do
  it "includes the Actions::Retrieve module" do
    expect(described_class.ancestors).to include Printfection::Actions::Retrieve
  end
end

RSpec.shared_examples "Actions::List" do
  it "includes the Actions::List module" do
    expect(described_class.ancestors).to include Printfection::Actions::List
  end
end

RSpec.shared_examples "Actions::Create" do
  it "includes the Actions::Create module" do
    expect(described_class.ancestors).to include Printfection::Actions::Create
  end
end

RSpec.shared_examples "Actions::Update" do
  it "includes the Actions::Update module" do
    expect(described_class.ancestors).to include Printfection::Actions::Update
  end
end

RSpec.shared_examples "Actions::Delete" do
  it "includes the Actions::Delete module" do
    expect(described_class.ancestors).to include Printfection::Actions::Delete
  end
end

