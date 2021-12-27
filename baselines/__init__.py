from gym.envs.registration import register

for grid_name in ['a', 'b', 'c']:
    register(
        id=f'Maze{grid_name.capitalize()}-v0',
        entry_point='baselines.envs.maze.maze:ParticleMazeEnv',
        kwargs={'grid_name': grid_name, 'reward_type': 'sparse'},
        max_episode_steps=50,
    )
    register(
        id='PointMassEmptyEnv-v1',
        entry_point='baselines.envs.pointmass:PointMassEnv',
        kwargs={
            'room_type': 'empty', # ['empty', 'wall', 'rooms']
        }
    )
    register(
        id='PointMassWallEnv-v1',
        entry_point='baselines.envs.pointmass:PointMassEnv',
        kwargs={
            'room_type': 'wall',
        }
    )
    register(
        id='PointMassRoomsEnv-v1',
        entry_point='baselines.envs.pointmass:PointMassEnv',
        kwargs={
            'room_type': 'rooms',
        }
    )