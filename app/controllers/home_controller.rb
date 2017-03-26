class HomeController < ApplicationController

  def teamselect
  end


# 팀을 선택하면 데이터 1개가 만들어짐
  def teamTimeMake
    @teamtime = Timeleft.new

    # id 1이면 그리핀도르 / 2면 슬리데린
    @teamtime.team = params[:id]

    # 기본 시간은 60초
    @teamtime.time = 60
    @teamtime.save

# index로 가서 카운트다운 시작!
    redirect_to "/home/index"
  end


# 카운트 다운하는 곳
  def index

    # 버튼 누를때마다 correct 액션에 갔다오는 시간을
    # 감안하기 위해 남은 시간에서 2초를 빼준다.
    # 대신 처음엔 60초에서 뺄 필요 없으니까
    # if 문으로 막아준다.
    if Timeleft.last.time == 60
      @time = Timeleft.last.time
    else
      @time = Timeleft.last.time - 2
    end

    @teamdata = Timeleft.last.correct

  end


# 정답!을 눌렀을때 도달하는 액션
  def correct

      # 팀선택 할때 만들었던 데이터를 가져온다.
      @time = Timeleft.last
      # hidden input에 담긴 value를 남은시간으로 저장한다.
      @time.time = params[:timeLeft]
      # 맞췄으니 correct +1을 해준다.
      @time.correct += 1
      @time. save
      # 다시 카운트하러 돌아가야지!
      redirect_to "/home/index"

  end

# 통과!를 눌렀을때 도달하는 액션
  def pass

    # 팀선택 할때 만들었던 데이터를 가져온다.
    @time = Timeleft.last
    @time.time = params[:timeLeft]

    # 여기선 통과를 했으니 correct를 건드릴 필요가 없다.
    @time. save
    redirect_to "/home/index"

  end

# 끝나면 도달하는 액션
  def finish
    # 방금 게임을 한 데이터를 가져온다.
    @time = Timeleft.last
    # team1 이면 그리핀도르 2이면 슬리데린
    if @time.team == 1
      @team = "그리핀도르"
    else
      @team = "슬리데린"
    end
  end
end
