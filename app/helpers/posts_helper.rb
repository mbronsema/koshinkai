module PostsHelper
  def videomatcher(content)
    if content.match('\[video:\s?\S+\s?\]') 
      fullcontent = content.match('\[video:\s?[^ ]+?\]')
      video_id = content.match('\[video:\s?(?<youtube_id>\w+)\]') 
      full_link = '</span></p><embed width="420" height="345" src="http://www.youtube.com/v/'
       + video_id[:youtube_id]  + 
       '" type="application/x-shockwave-flash" allowfullscreen="true"></embed><p><span> ' 
      if fullcontent.length > 1 
        for e in fullcontent 
         video = content.gsub(e, full_link) 
        end 
      else 
        video = content.gsub(fullcontent[0], full_link) 
      end 
    else
      video = content
    end 
    return video
  end
end