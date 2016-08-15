%%% @doc       stargazer top level supervisor.
%%% @author    Eric Bailey
%%% @version   0.0.1
%%% @copyright 2016 Eric Bailey

-module(stargazer_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%%===================================================================
%%% API functions
%%%===================================================================

start_link() -> supervisor:start_link({local,?SERVER}, ?MODULE, []).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
  SupFlags   = #{strategy  => one_for_all,
                 intensity => 0,
                 period    => 1},
  ElliConfig = [],                              % TODO: Add handler(s) here.
  Elli       = #{id        => stargazer,
                 start     => {elli,start_link,[ElliConfig]},
                 restart   => permanent,
                 shutdown  => 5000,
                 type      => worker,
                 modules   => [elli]},
  Children   = [Elli],
  {ok,{SupFlags,Children}}.
