// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_paginated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiPaginatedResponse<T> _$ApiPaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiPaginatedResponse<T>(
      json['meta'] == null
          ? null
          : ApiPagination.fromJson(json['meta'] as Map<String, dynamic>),
      (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );
