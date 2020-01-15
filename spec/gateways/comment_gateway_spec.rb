require 'rails_helper'

RSpec.describe CommentGateway, type: :model do
  it { expect(described_class::RELEVANT_COMMENT_LENGTH).to eq(20) }

  describe '#relevant_comments' do
    subject { described_class.new }

    context 'when story has deleted comment' do
      let(:deleted_comment) { 22049993 }
      let(:story_id) { 22049552 }

      it 'does not include comment in relevant comments' do
        VCR.use_cassette("story_with_deleted_comment") do
          result = subject.relevant_comments(story_id)
          comment_ids = result.map{ |obj| obj['id'] }.compact
          expect(comment_ids).to_not include(deleted_comment)
        end
      end
    end

    context 'when story has any comment' do
      # story with more than 10 relevant comments
      let(:story_id) { 8863 }

      context 'when story has more than 10 relevant comments' do
        it 'returns array with 10 elements' do
          VCR.use_cassette('story_with_more_than_10_relevant_comments') do
            expect(subject.relevant_comments(story_id).length).to eq(10)
          end
        end

        it 'returns json with comment data' do
          VCR.use_cassette('story_with_more_than_10_relevant_comments') do
            expect(subject.relevant_comments(story_id).first).to eq({
              "by" => "BrandonM",
              "id" => 9224,
              "kids" => [9272],
              "parent" => 8863,
              "text" => "I have a few qualms with this app:<p>1. For a Linux user, you can already build such a system yourself quite trivially by getting an FTP account, mounting it locally with curlftpfs, and then using SVN or CVS on the mounted filesystem.  From Windows or Mac, this FTP account could be accessed through built-in software.<p>2. It doesn't actually replace a USB drive.  Most people I know e-mail files to themselves or host them somewhere online to be able to perform presentations, but they still carry a USB drive in case there are connectivity problems.  This does not solve the connectivity issue.<p>3. It does not seem very \"viral\" or income-generating.  I know this is premature at this point, but without charging users for the service, is it reasonable to expect to make money off of this?",
              "time" => 1175786214,
              "type" => "comment"
            })
          end
        end
      end

      context 'when story does not have more than 10 relevant comments' do
        # story with 3 relevant comments
        let(:story_id) { 22049047 }

        it 'returns array with max number of relevant comments' do
          VCR.use_cassette('story_with_less_than_10_relevant_comments') do
            expect(subject.relevant_comments(story_id).length).to eq(3)
          end
        end
      end
    end

    context 'when story do not have comments' do
      # story without relevant comments in the moment of the request
      let(:story_id) { 22050225 }

      it 'returns empty array' do
        VCR.use_cassette('story_without_comments') do
          expect(subject.relevant_comments(story_id)).to eq([])
        end
      end
    end
  end
end
