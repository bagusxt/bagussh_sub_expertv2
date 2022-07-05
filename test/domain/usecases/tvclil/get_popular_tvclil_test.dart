import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_popluar_tvclil.dart';

import 'package:dartz/dartz.dart';
import '../../../helpers/test_helper_tvclil.mocks.dart';

void main() {
  late GetPopularTvclil 
  usecase;
  late MockTvclilRepository 
  mockTvRpository;

  setUp(() {
    mockTvRpository = 
    MockTvclilRepository();
    usecase = 
    GetPopularTvclil(mockTvRpository);
  });

  final tTv = 
  <Tvclil>[];

  group('Get Popular Tv Tests', () {
    group('execute', () {
      test(
          'should get list of tv from the repository when execute function is called',
              () async {
            // arrange
            when(mockTvRpository.getPopularTv())
                .thenAnswer((_) async => Right(tTv));
            // act
            final result = await usecase.execute();
            // assert
            expect(result, Right(tTv));
          });
    });
  });
}