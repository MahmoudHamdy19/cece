import 'package:cece/core/app_export.dart';
import 'package:cece/core/errors/error_handler.dart';
import 'package:cece/core/errors/failure.dart';
import 'package:cece/data/apiClient/api_client.dart';
import 'package:cece/data/models/user/user_model.dart';
import 'package:dartz/dartz.dart';

import '../models/conference/organizer_events_model.dart';

class UserRemoteDataSource {
  ApiClient apiClient;
  NetworkInfo networkInfo;

  UserRemoteDataSource(this.apiClient, this.networkInfo);

  Future<Either<Failure, String>> login(String email, String password) async {
    if (await networkInfo.isConnected()) {
      try {
        var res = await apiClient.login(email, password);
        return Right(res);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
          ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION).failure);
    }
  }

  Future<Either<Failure, void>> forgetPassword(String email) async {
    if (await networkInfo.isConnected()) {
      try {
        var res = await apiClient.forgetPassword(email);
        return Right(res);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
          ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION).failure);
    }
  }

  Future<Either<Failure, void>> register(
      UserModel userModel, String password) async {
    if (await networkInfo.isConnected()) {
      try {
        var res = await apiClient.register(userModel, password);
        return Right(res);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
          ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION).failure);
    }
  }

  Future<Either<Failure, UserModel>> getProfile() async {
    if (await networkInfo.isConnected()) {
      try {
        var res = await apiClient.getProfile();
        return Right(res);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
          ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION).failure);
    }
  }

  Future<Either<Failure, void>> updateProfile(UserModel user) async {
    if (await networkInfo.isConnected()) {
      try {
        var res = apiClient.updateProfile(user);
        return Right(res);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
          ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION).failure);
    }
  }

  Future<Either<Failure, void>> addConference(
      OrganizerEvents organizerEvents) async {
    if (await networkInfo.isConnected()) {
      try {
        var response = await apiClient.addConference(organizerEvents);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
          ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION).failure);
    }
  }

  Future<Either<Failure, void>> updateConference(
      OrganizerEvents organizerEvents) async {
    if (await networkInfo.isConnected()) {
      try {
        var response = await apiClient.updateConference(organizerEvents);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
          ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION).failure);
    }
  }


  Future<Either<Failure, void>> deleteConference(
      String organizerEventsID) async {
    if (await networkInfo.isConnected()) {
      try {
        var response = await apiClient.deleteConferences(organizerEventsID);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
          ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION).failure);
    }
  }

  Future<Either<Failure, List<OrganizerEvents>>> getConferences() async {
    if (await networkInfo.isConnected()) {
      try {
        var response = await apiClient.getConferences();
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
          ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION).failure);
    }
  }
}
