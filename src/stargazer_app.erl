%%% @doc       stargazer public API
%%% @author    Eric Bailey
%%% @version   0.0.1
%%% @copyright 2016 Eric Bailey

-module(stargazer_app).

-behaviour(application).

%% Application callbacks
-export([start/2,stop/1]).

%%%===================================================================
%%% API
%%%===================================================================

start(_StartType, _StartArgs) -> stargazer_sup:start_link().

stop(_State) -> ok.
