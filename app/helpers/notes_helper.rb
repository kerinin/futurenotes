module NotesHelper
  def markdown(text)
    raw( BlueCloth::new(text).to_html )
  end
end
