import 'package:cece/core/app_export.dart';
import 'package:cece/core/errors/error_handler.dart';
import 'package:cece/core/errors/failure.dart';
import 'package:cece/data/apiClient/programmer_api_client.dart';
import 'package:dartz/dartz.dart';
import '../models/conference/organizer_events_model.dart';

class ProgrammerRemoteDataSource {
  ProgrammerApiClient apiClient ;
  NetworkInfo networkInfo;

  ProgrammerRemoteDataSource(this.apiClient, this.networkInfo);

  Future<Either<Failure,List<OrganizerEvents>>> getConferences ()async{
    if(await networkInfo.isConnected()) {
      try {
        var response = await apiClient.getAllConferences();
        return Right(response);
      }catch(e){
        return Left(ErrorHandler.handle(e).failure);

      }
    }else {
      return Left(ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION).failure);

    }
  }
  Future<Either<Failure,void>> updateConferences(OrganizerEvents organizerEvents)async{
    if(await networkInfo.isConnected()) {
      try {
        var response = await apiClient.updateConference(organizerEvents);
        return Right(response);
      }catch(e){
        return Left(ErrorHandler.handle(e).failure);
      }
    }else {
      return Left(ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION).failure);

    }
  }

 }