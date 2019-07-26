defmodule FootballResults.Data.Protobuf do
  use Protobuf, """
  message Match {
    required int32 id        = 1;
    required string division = 2;
    required int32 season    = 3;
    required string ateam    = 4;
    required string hteam    = 5;
    required int32 ftag      = 6;
    required int32 fthg      = 7;
    required int32 htag      = 8;
    required int32 hthg      = 9;
    required string ftr      = 10;
    required string htr      = 11;
    required string date     = 12;
  }

  message Pair {
    required string division = 1;
    required int32 season = 2;
  }
  """
end
