include RSpec

require_relative 'heap_min_tree'

RSpec.describe HeapMinTree, type: Class do
  let (:tree) { HeapMinTree.new() }
  
  let (:matrix) { Node.new("The Matrix", 87) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node as a left child" do
      tree.insert(pacific_rim)
      tree.insert(martian)
      expect(tree.root.left.title).to eq "The Martian"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(district)
      tree.insert(matrix)
      tree.insert(shawshank)
      expect(tree.root.right.title).to eq "The Shawshank Redemption"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(empire)
      tree.insert(mad_max_2)
      expect(tree.find(tree.root, nil)).to eq nil
    end

    it "properly finds a node" do
      tree.insert(pacific_rim)
      expect(tree.find(tree.root, pacific_rim.title).title).to eq "Pacific Rim"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      tree.insert(pacific_rim)
      expect(tree.delete(tree.root, nil)).to eq nil
    end

    it "properly deletes a left-left node" do
      tree.insert(braveheart)
      tree.insert(pacific_rim)
      tree.delete(tree.root, braveheart.title)
      expect(tree.find(tree.root, braveheart.title)).to be_nil
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nInception: 86\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\nMad Max 2: The Road Warrior: 98\n"
       tree.insert(hope)
       tree.insert(empire)
       tree.insert(jedi)
       tree.insert(martian)
       tree.insert(pacific_rim)
       tree.insert(inception)
       tree.insert(braveheart)
       tree.insert(shawshank)
       tree.insert(district)
       tree.insert(mad_max_2)
       expect { tree.printf }.to output(expected_output).to_stdout
     }
  end
end