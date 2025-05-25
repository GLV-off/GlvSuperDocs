@startuml

interface Doc
interface Cols
interface Col
interface Rows
interface Row
Rows --o Doc
Row --o Rows
Cols --o Doc
Col --o Cols

abstract class BaseDoc

BaseDoc --|> Doc
BaseRows --|> Rows
BaseRow --|> Row
BaseCols --|> Cols
BaseCol --|> Col

@enduml