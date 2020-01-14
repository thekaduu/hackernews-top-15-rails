require 'rails_helper'

describe RelevantCommentsFactory do
  let(:data) {
    [
      {
        "by" => "BrandonM",
        "id" => 9224,
        "kids" => [9272],
        "parent" => 8863,
        "text" => "I have a few qualms with this app:<p>1. For a Linux user, you can already build such a system yourself quite trivially by getting an FTP account, mounting it locally with curlftpfs, and then using SVN or CVS on the mounted filesystem.  From Windows or Mac, this FTP account could be accessed through built-in software.<p>2. It doesn't actually replace a USB drive.  Most people I know e-mail files to themselves or host them somewhere online to be able to perform presentations, but they still carry a USB drive in case there are connectivity problems.  This does not solve the connectivity issue.<p>3. It does not seem very \"viral\" or income-generating.  I know this is premature at this point, but without charging users for the service, is it reasonable to expect to make money off of this?",
        "time" => 1175786214,
        "type" => "comment"
      }
    ]
  }

  subject { described_class.new(data) }

  describe '#call' do
    it 'returns an array of comments' do
      result = subject.call
      expect(result.count).to eq(1)
      expect(result[0]).to be_kind_of(Comment)
    end

    it 'instantiates comment correctly' do
      story = subject.call.first
      expect(story.as_json).to eq(data[0])
    end
  end
end
