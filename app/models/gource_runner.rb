class GourceRunner
  def initialize(repository)
    @repository = repository
  end

  def run!
    `cd #{@repository.path} && #{xvfb_cmd} | #{avconv_cmd} 2> /dev/null`
  end

  private

  def xvfb_cmd
    "xvfb-run -a -s '-screen 0 1280x720x24' gource -1280x720 --output-framerate 30 --auto-skip-seconds 1 --seconds-per-day 1 -o -"
  end

  def avconv_cmd
    "avconv -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset ultrafast -crf 1 -threads 0 -bf 0 #{@repository.video_path}"
  end
end
