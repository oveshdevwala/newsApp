import 'package:news_app/features/bookmark/model/db_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  // variable
  ///Db
  static const dbName = 'News.db';
  static const dbTable = 'BookmarkTable';
  static const dbVersion = 1;

  ///Data
  static const colSourceID = 'sourceId';
  static const colSourceName = 'sourceName';
  static const colAuthor = 'author';
  static const colContent = 'content';
  static const colDicription = 'dicription';
  static const colPublishedAt = 'publishedAt';
  static const colTitle = 'title';
  static const colBookmark = 'bookmark';
  static const colRedirecturl = 'RedirectUrl';
  static const colUrlToImage = 'urlToImage';
  static const colId = 'id';
  DataBaseHelper._();
  // private constructor
  static DataBaseHelper instance = DataBaseHelper._();
  // initialize database
  Database? db;
  Future<Database> inizDataBase() async {
    var docDirectory = await getApplicationDocumentsDirectory();
    var path = join(docDirectory.path, dbName);
    onDbCreate(Database db, int version) {
      var stringType = 'text';
      var autoincrementType = 'integer primary key autoincrement';
      var intType = 'integer';
      db.execute('''
CREATE TABLE $dbTable (
  $colId  $autoincrementType,
  $colTitle $stringType,
  $colBookmark $intType,
  $colUrlToImage $stringType,
  $colDicription $stringType,
  $colRedirecturl $stringType,
  $colPublishedAt $stringType,
  $colContent $stringType,
  $colAuthor $stringType,
  $colSourceID $stringType,
  $colSourceName $stringType
  )
''');
    }

    return await openDatabase(path, version: dbVersion, onCreate: onDbCreate);
  }

  // get DataBase
  Future<Database> getDb() async {
    if (db != null) {
      return db!;
    } else {
      return inizDataBase();
    }
  }

  Future<bool> addBookmark(BookmarkDbModel model) async {
    var db = await getDb();
    var rowEffected = await db.insert(dbTable, model.toMap());
    return rowEffected >= 0;
  }

  Future<List<BookmarkDbModel>> getBookmarks() async {
    var db = await getDb();
    List<BookmarkDbModel> bookmarkList = [];
    var data = await db.query(dbTable);
    for (Map<String, dynamic> eachBookmark in data) {
      var bookmarkModel = BookmarkDbModel.fromMap(eachBookmark);
      bookmarkList.add(bookmarkModel);
    }
    return bookmarkList;
  }

  Future<bool> deleteBookmark(String url) async {
    var db = await getDb();
    var rowEffected =
        await db.delete(dbTable, where: '$colUrlToImage = $url' );
    return rowEffected >= 0;
  }
}
