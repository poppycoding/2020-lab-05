## An emoji guide for your commit messages

#### .git提交

```html
<type>(<scope>): <subject>
<BLANK LINE>
<body>
```

- **type**: [必选],用于说明 commit 的类别 !
- **scope**: [非必选],用于说明 commit 影响的范围，比如数据层、控制层、视图层等等 !
- **subject**: [必选],对 commit 的简短描述,50个字符;首字母小写,动词开头,第一人称现在时,结尾无句号 !
- **body**:  [非必选],对commit 的详细描述，可以分成多行 !



#### .git提交文字版

- **feat**: 提交一个新功能.

  ```yaml
  feat: A new feature
  ```

- **fix**: 修复bug问题.

  ```yaml
  fix: A bug fix
  ```

- **docs**: 修改文档,如: md, pdf等.

  ```yaml
  docs: Documentation only changes
  ```

- **style**: 代码风格修改(不改变代码本身),如: 格式, 注释,  空格等. 

  ```yaml
  style: Changes that do not affect the meaning of the code (formatting, etc)
  ```

- **refactor**: 重构代码(代码本身发生变动,功能,性能不变),如: 代码结构, 重命名, 提取精炼代码等. 

  ```yaml
  refactor: A code change that neither fixes a bug nor adds a feature
  ```

- **perf**: 提高性能的代码改动,如: 数据结构的更换, sql的优化, 算法的变更等.

  ```yaml
  perf: A code change that improves performance
  ```

- **test**: 增加测试用例

  ```yaml
  test: Adding missing tests
  ```

- **chore**: 构建过程的变化,辅助性的工具,库的变更,如: maven依赖的变化

  ```yaml
  chore: Changes to the build process or auxiliary tools and libraries
  ```



#### .git提交表情版

:tada: tada: init commit

:see_no_evil: see_no_evil: add or update a .gitignore file

:construction: construction: work in progress

:hankey: hankey: write bad code that will improve after

:sparkles: sparkles: add new feature for ...

:boom: boom: add breaking change for ...

:bug: bug: fix bug of ...

:pencil2: pencil2: fix some typos

:ambulance: ambulance: hotfix for critical bug

:lock: lock: fix security issues

:art: art: format the code style

:truck: truck: move & rename file

:fire: fire: remove unused code & file

♻️ recycle: refactor code

:ok_hand: ok_hand: update code due to code review

:card_file_box: card_file_box: change sql statement for performing database 

:rotating_light: rotating_ light: remove linter warnings

:memo: memo: write some comments as javadoc

:wrench: wrench: change ... configuration file

:white_check_mark: white_check_mark: add test cases 

:arrow_down: downgrade dependency of

:heavy_minus_sign:heavy_minus_sign: remove dependency of

:heavy_plus_sign: heavy_plus_sign: add dependency of 

:arrow_up: upgrade dependency of

:mute: mute: remove logs

:loud_sound: loud_sound: add logs

:zap: zip: improve the performance