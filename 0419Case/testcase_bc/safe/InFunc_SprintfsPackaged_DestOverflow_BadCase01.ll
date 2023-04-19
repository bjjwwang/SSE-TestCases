; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/safe/InFunc_SprintfsPackaged_DestOverflow_BadCase01.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/safe/InFunc_SprintfsPackaged_DestOverflow_BadCase01.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @SRC_vsnprintf_s(i8* noundef %buf, i64 noundef %destMax, i64 noundef %count, i8* noundef %format, ...) #0 !dbg !9 {
entry:
  %buf.addr = alloca i8*, align 8
  %destMax.addr = alloca i64, align 8
  %count.addr = alloca i64, align 8
  %format.addr = alloca i8*, align 8
  %ret = alloca i32, align 4
  %arglist = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !22, metadata !DIExpression()), !dbg !23
  store i64 %destMax, i64* %destMax.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %destMax.addr, metadata !24, metadata !DIExpression()), !dbg !25
  store i64 %count, i64* %count.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %count.addr, metadata !26, metadata !DIExpression()), !dbg !27
  store i8* %format, i8** %format.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %format.addr, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %ret, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %arglist, metadata !32, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !48
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*, !dbg !48
  call void @llvm.va_start(i8* %arraydecay1), !dbg !48
  %0 = load i8*, i8** %buf.addr, align 8, !dbg !49
  %1 = load i64, i64* %destMax.addr, align 8, !dbg !50
  %2 = load i8*, i8** %format.addr, align 8, !dbg !51
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !52
  %call = call i32 @VOS_vsnprintf_s(i8* noundef %0, i64 noundef %1, i8* noundef %2, %struct.__va_list_tag* noundef %arraydecay2), !dbg !53
  store i32 %call, i32* %ret, align 4, !dbg !54
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !55
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*, !dbg !55
  call void @llvm.va_end(i8* %arraydecay34), !dbg !55
  %3 = load i32, i32* %ret, align 4, !dbg !56
  ret i32 %3, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #2

declare i32 @VOS_vsnprintf_s(i8* noundef, i64 noundef, i8* noundef, %struct.__va_list_tag* noundef) #3

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_219(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !58 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  %count = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i64* %len, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !69
  %call = call i64 @strlen(i8* noundef %0), !dbg !70
  store i64 %call, i64* %len, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i64* %count, metadata !71, metadata !DIExpression()), !dbg !72
  %1 = load i64, i64* %len, align 8, !dbg !73
  %cmp = icmp ugt i64 %1, 0, !dbg !74
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !73

cond.true:                                        ; preds = %entry
  %2 = load i64, i64* %len, align 8, !dbg !75
  %sub = sub i64 %2, 1, !dbg !76
  br label %cond.end, !dbg !73

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !73

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub, %cond.true ], [ 0, %cond.false ], !dbg !73
  store i64 %cond, i64* %count, align 8, !dbg !72
  %3 = load i8*, i8** %buf.addr, align 8, !dbg !77
  %4 = load i64, i64* %len, align 8, !dbg !78
  %5 = load i64, i64* %count, align 8, !dbg !79
  %6 = load i8*, i8** %msg.addr, align 8, !dbg !80
  %call1 = call i32 (i8*, i64, i64, i8*, ...) @SRC_vsnprintf_s(i8* noundef %3, i64 noundef %4, i64 noundef %5, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %6), !dbg !81
  ret void, !dbg !82
}

declare i64 @strlen(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @callvsnprintf_s1(i8* noundef %buf, i64 noundef %destMax, i64 noundef %count, i8* noundef %format, ...) #0 !dbg !83 {
entry:
  %buf.addr = alloca i8*, align 8
  %destMax.addr = alloca i64, align 8
  %count.addr = alloca i64, align 8
  %format.addr = alloca i8*, align 8
  %ret = alloca i32, align 4
  %arglist = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i64 %destMax, i64* %destMax.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %destMax.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i64 %count, i64* %count.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %count.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8* %format, i8** %format.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %format.addr, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !92, metadata !DIExpression()), !dbg !93
  store i32 0, i32* %ret, align 4, !dbg !93
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %arglist, metadata !94, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !96
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*, !dbg !96
  call void @llvm.va_start(i8* %arraydecay1), !dbg !96
  %0 = load i8*, i8** %buf.addr, align 8, !dbg !97
  %1 = load i64, i64* %destMax.addr, align 8, !dbg !98
  %2 = load i64, i64* %count.addr, align 8, !dbg !99
  %3 = load i8*, i8** %format.addr, align 8, !dbg !100
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !101
  %call = call i32 (i8*, i64, i64, i8*, %struct.__va_list_tag*, ...) bitcast (i32 (...)* @vsnprintf_s to i32 (i8*, i64, i64, i8*, %struct.__va_list_tag*, ...)*)(i8* noundef %0, i64 noundef %1, i64 noundef %2, i8* noundef %3, %struct.__va_list_tag* noundef %arraydecay2), !dbg !102
  store i32 %call, i32* %ret, align 4, !dbg !103
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !104
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*, !dbg !104
  call void @llvm.va_end(i8* %arraydecay34), !dbg !104
  %4 = load i32, i32* %ret, align 4, !dbg !105
  ret i32 %4, !dbg !106
}

declare i32 @vsnprintf_s(...) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_213(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !107 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  %count = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !108, metadata !DIExpression()), !dbg !109
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !110, metadata !DIExpression()), !dbg !111
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %len, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !116
  %call = call i64 @strlen(i8* noundef %0), !dbg !117
  store i64 %call, i64* %len, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i64* %count, metadata !118, metadata !DIExpression()), !dbg !119
  %1 = load i64, i64* %len, align 8, !dbg !120
  %cmp = icmp ugt i64 %1, 0, !dbg !121
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !120

cond.true:                                        ; preds = %entry
  %2 = load i64, i64* %len, align 8, !dbg !122
  %sub = sub i64 %2, 1, !dbg !123
  br label %cond.end, !dbg !120

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !120

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub, %cond.true ], [ 0, %cond.false ], !dbg !120
  store i64 %cond, i64* %count, align 8, !dbg !119
  %3 = load i8*, i8** %buf.addr, align 8, !dbg !124
  %4 = load i64, i64* %len, align 8, !dbg !125
  %5 = load i64, i64* %count, align 8, !dbg !126
  %6 = load i8*, i8** %msg.addr, align 8, !dbg !127
  %call1 = call i32 (i8*, i64, i64, i8*, ...) @callvsnprintf_s1(i8* noundef %3, i64 noundef %4, i64 noundef %5, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %6), !dbg !128
  ret void, !dbg !129
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @callvsnprintf_s(i8* noundef %buf, i64 noundef %destMax, i64 noundef %count, i8* noundef %format, ...) #0 !dbg !130 {
entry:
  %buf.addr = alloca i8*, align 8
  %destMax.addr = alloca i64, align 8
  %count.addr = alloca i64, align 8
  %format.addr = alloca i8*, align 8
  %ret = alloca i32, align 4
  %arglist = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !131, metadata !DIExpression()), !dbg !132
  store i64 %destMax, i64* %destMax.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %destMax.addr, metadata !133, metadata !DIExpression()), !dbg !134
  store i64 %count, i64* %count.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %count.addr, metadata !135, metadata !DIExpression()), !dbg !136
  store i8* %format, i8** %format.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %format.addr, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !139, metadata !DIExpression()), !dbg !140
  store i32 0, i32* %ret, align 4, !dbg !140
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %arglist, metadata !141, metadata !DIExpression()), !dbg !142
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !143
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*, !dbg !143
  call void @llvm.va_start(i8* %arraydecay1), !dbg !143
  %0 = load i8*, i8** %buf.addr, align 8, !dbg !144
  %1 = load i64, i64* %destMax.addr, align 8, !dbg !145
  %2 = load i64, i64* %count.addr, align 8, !dbg !146
  %3 = load i8*, i8** %format.addr, align 8, !dbg !147
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !148
  %call = call i32 (i8*, i64, i64, i8*, %struct.__va_list_tag*, ...) bitcast (i32 (...)* @vsnprintf_s to i32 (i8*, i64, i64, i8*, %struct.__va_list_tag*, ...)*)(i8* noundef %0, i64 noundef %1, i64 noundef %2, i8* noundef %3, %struct.__va_list_tag* noundef %arraydecay2), !dbg !149
  store i32 %call, i32* %ret, align 4, !dbg !150
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !151
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*, !dbg !151
  call void @llvm.va_end(i8* %arraydecay34), !dbg !151
  %4 = load i32, i32* %ret, align 4, !dbg !152
  ret i32 %4, !dbg !153
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_217(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !154 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  %count = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !155, metadata !DIExpression()), !dbg !156
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !157, metadata !DIExpression()), !dbg !158
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i64* %len, metadata !161, metadata !DIExpression()), !dbg !162
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !163
  %call = call i64 @strlen(i8* noundef %0), !dbg !164
  store i64 %call, i64* %len, align 8, !dbg !162
  call void @llvm.dbg.declare(metadata i64* %count, metadata !165, metadata !DIExpression()), !dbg !166
  %1 = load i64, i64* %len, align 8, !dbg !167
  %cmp = icmp ugt i64 %1, 0, !dbg !168
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !167

cond.true:                                        ; preds = %entry
  %2 = load i64, i64* %len, align 8, !dbg !169
  %sub = sub i64 %2, 1, !dbg !170
  br label %cond.end, !dbg !167

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !167

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub, %cond.true ], [ 0, %cond.false ], !dbg !167
  store i64 %cond, i64* %count, align 8, !dbg !166
  %3 = load i8*, i8** %buf.addr, align 8, !dbg !171
  %4 = load i64, i64* %len, align 8, !dbg !172
  %5 = load i64, i64* %count, align 8, !dbg !173
  %6 = load i8*, i8** %msg.addr, align 8, !dbg !174
  %call1 = call i32 (i8*, i64, i64, i8*, ...) @callvsnprintf_s(i8* noundef %3, i64 noundef %4, i64 noundef %5, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %6), !dbg !175
  ret void, !dbg !176
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !177 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %buf = alloca [16 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !181, metadata !DIExpression()), !dbg !182
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !183, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata [16 x i8]* %buf, metadata !185, metadata !DIExpression()), !dbg !189
  %0 = load i32, i32* %argc.addr, align 4, !dbg !190
  %cmp = icmp sgt i32 %0, 1, !dbg !192
  br i1 %cmp, label %if.then, label %if.end, !dbg !193

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !194
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !196
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !196
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !196
  call void @cwe120_c_217(i8* noundef %arraydecay, i64 noundef 16, i8* noundef %2), !dbg !197
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !198
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !199
  %arrayidx2 = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !199
  %4 = load i8*, i8** %arrayidx2, align 8, !dbg !199
  call void @cwe120_c_213(i8* noundef %arraydecay1, i64 noundef 16, i8* noundef %4), !dbg !200
  %arraydecay3 = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !201
  %5 = load i8**, i8*** %argv.addr, align 8, !dbg !202
  %arrayidx4 = getelementptr inbounds i8*, i8** %5, i64 1, !dbg !202
  %6 = load i8*, i8** %arrayidx4, align 8, !dbg !202
  call void @cwe120_c_219(i8* noundef %arraydecay3, i64 noundef 16, i8* noundef %6), !dbg !203
  br label %if.end, !dbg !204

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !205
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nofree nosync nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/safe/InFunc_SprintfsPackaged_DestOverflow_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "SRC_vsnprintf_s", scope: !10, file: !10, line: 11, type: !11, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!10 = !DIFile(filename: "safe/InFunc_SprintfsPackaged_DestOverflow_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !14, !16, !16, !14, null}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !17, line: 31, baseType: !18)
!17 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !19, line: 94, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!20 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!21 = !{}
!22 = !DILocalVariable(name: "buf", arg: 1, scope: !9, file: !10, line: 11, type: !14)
!23 = !DILocation(line: 11, column: 27, scope: !9)
!24 = !DILocalVariable(name: "destMax", arg: 2, scope: !9, file: !10, line: 11, type: !16)
!25 = !DILocation(line: 11, column: 39, scope: !9)
!26 = !DILocalVariable(name: "count", arg: 3, scope: !9, file: !10, line: 11, type: !16)
!27 = !DILocation(line: 11, column: 55, scope: !9)
!28 = !DILocalVariable(name: "format", arg: 4, scope: !9, file: !10, line: 11, type: !14)
!29 = !DILocation(line: 11, column: 68, scope: !9)
!30 = !DILocalVariable(name: "ret", scope: !9, file: !10, line: 13, type: !13)
!31 = !DILocation(line: 13, column: 9, scope: !9)
!32 = !DILocalVariable(name: "arglist", scope: !9, file: !10, line: 14, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !34, line: 14, baseType: !35)
!34 = !DIFile(filename: "/usr/local/Cellar/llvm/14.0.6/lib/clang/14.0.6/include/stdarg.h", directory: "")
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !10, baseType: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 192, elements: !45)
!37 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !38)
!38 = !{!39, !41, !42, !44}
!39 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !37, file: !10, line: 14, baseType: !40, size: 32)
!40 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !37, file: !10, line: 14, baseType: !40, size: 32, offset: 32)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !37, file: !10, line: 14, baseType: !43, size: 64, offset: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !37, file: !10, line: 14, baseType: !43, size: 64, offset: 128)
!45 = !{!46}
!46 = !DISubrange(count: 1)
!47 = !DILocation(line: 14, column: 13, scope: !9)
!48 = !DILocation(line: 15, column: 5, scope: !9)
!49 = !DILocation(line: 16, column: 27, scope: !9)
!50 = !DILocation(line: 16, column: 32, scope: !9)
!51 = !DILocation(line: 16, column: 41, scope: !9)
!52 = !DILocation(line: 16, column: 49, scope: !9)
!53 = !DILocation(line: 16, column: 11, scope: !9)
!54 = !DILocation(line: 16, column: 9, scope: !9)
!55 = !DILocation(line: 17, column: 5, scope: !9)
!56 = !DILocation(line: 18, column: 12, scope: !9)
!57 = !DILocation(line: 18, column: 5, scope: !9)
!58 = distinct !DISubprogram(name: "cwe120_c_219", scope: !10, file: !10, line: 24, type: !59, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!59 = !DISubroutineType(types: !60)
!60 = !{null, !14, !16, !14}
!61 = !DILocalVariable(name: "buf", arg: 1, scope: !58, file: !10, line: 24, type: !14)
!62 = !DILocation(line: 24, column: 25, scope: !58)
!63 = !DILocalVariable(name: "bufSize", arg: 2, scope: !58, file: !10, line: 24, type: !16)
!64 = !DILocation(line: 24, column: 37, scope: !58)
!65 = !DILocalVariable(name: "msg", arg: 3, scope: !58, file: !10, line: 24, type: !14)
!66 = !DILocation(line: 24, column: 52, scope: !58)
!67 = !DILocalVariable(name: "len", scope: !58, file: !10, line: 26, type: !16)
!68 = !DILocation(line: 26, column: 12, scope: !58)
!69 = !DILocation(line: 26, column: 25, scope: !58)
!70 = !DILocation(line: 26, column: 18, scope: !58)
!71 = !DILocalVariable(name: "count", scope: !58, file: !10, line: 27, type: !16)
!72 = !DILocation(line: 27, column: 12, scope: !58)
!73 = !DILocation(line: 27, column: 21, scope: !58)
!74 = !DILocation(line: 27, column: 25, scope: !58)
!75 = !DILocation(line: 27, column: 31, scope: !58)
!76 = !DILocation(line: 27, column: 35, scope: !58)
!77 = !DILocation(line: 29, column: 21, scope: !58)
!78 = !DILocation(line: 29, column: 26, scope: !58)
!79 = !DILocation(line: 29, column: 31, scope: !58)
!80 = !DILocation(line: 29, column: 44, scope: !58)
!81 = !DILocation(line: 29, column: 5, scope: !58)
!82 = !DILocation(line: 30, column: 1, scope: !58)
!83 = distinct !DISubprogram(name: "callvsnprintf_s1", scope: !10, file: !10, line: 32, type: !11, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!84 = !DILocalVariable(name: "buf", arg: 1, scope: !83, file: !10, line: 32, type: !14)
!85 = !DILocation(line: 32, column: 28, scope: !83)
!86 = !DILocalVariable(name: "destMax", arg: 2, scope: !83, file: !10, line: 32, type: !16)
!87 = !DILocation(line: 32, column: 40, scope: !83)
!88 = !DILocalVariable(name: "count", arg: 3, scope: !83, file: !10, line: 32, type: !16)
!89 = !DILocation(line: 32, column: 56, scope: !83)
!90 = !DILocalVariable(name: "format", arg: 4, scope: !83, file: !10, line: 32, type: !14)
!91 = !DILocation(line: 32, column: 69, scope: !83)
!92 = !DILocalVariable(name: "ret", scope: !83, file: !10, line: 34, type: !13)
!93 = !DILocation(line: 34, column: 9, scope: !83)
!94 = !DILocalVariable(name: "arglist", scope: !83, file: !10, line: 35, type: !33)
!95 = !DILocation(line: 35, column: 13, scope: !83)
!96 = !DILocation(line: 36, column: 5, scope: !83)
!97 = !DILocation(line: 37, column: 23, scope: !83)
!98 = !DILocation(line: 37, column: 28, scope: !83)
!99 = !DILocation(line: 37, column: 37, scope: !83)
!100 = !DILocation(line: 37, column: 44, scope: !83)
!101 = !DILocation(line: 37, column: 52, scope: !83)
!102 = !DILocation(line: 37, column: 11, scope: !83)
!103 = !DILocation(line: 37, column: 9, scope: !83)
!104 = !DILocation(line: 38, column: 5, scope: !83)
!105 = !DILocation(line: 39, column: 12, scope: !83)
!106 = !DILocation(line: 39, column: 5, scope: !83)
!107 = distinct !DISubprogram(name: "cwe120_c_213", scope: !10, file: !10, line: 45, type: !59, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!108 = !DILocalVariable(name: "buf", arg: 1, scope: !107, file: !10, line: 45, type: !14)
!109 = !DILocation(line: 45, column: 25, scope: !107)
!110 = !DILocalVariable(name: "bufSize", arg: 2, scope: !107, file: !10, line: 45, type: !16)
!111 = !DILocation(line: 45, column: 37, scope: !107)
!112 = !DILocalVariable(name: "msg", arg: 3, scope: !107, file: !10, line: 45, type: !14)
!113 = !DILocation(line: 45, column: 52, scope: !107)
!114 = !DILocalVariable(name: "len", scope: !107, file: !10, line: 47, type: !16)
!115 = !DILocation(line: 47, column: 12, scope: !107)
!116 = !DILocation(line: 47, column: 25, scope: !107)
!117 = !DILocation(line: 47, column: 18, scope: !107)
!118 = !DILocalVariable(name: "count", scope: !107, file: !10, line: 48, type: !16)
!119 = !DILocation(line: 48, column: 12, scope: !107)
!120 = !DILocation(line: 48, column: 21, scope: !107)
!121 = !DILocation(line: 48, column: 24, scope: !107)
!122 = !DILocation(line: 48, column: 29, scope: !107)
!123 = !DILocation(line: 48, column: 33, scope: !107)
!124 = !DILocation(line: 50, column: 22, scope: !107)
!125 = !DILocation(line: 50, column: 27, scope: !107)
!126 = !DILocation(line: 50, column: 32, scope: !107)
!127 = !DILocation(line: 50, column: 45, scope: !107)
!128 = !DILocation(line: 50, column: 5, scope: !107)
!129 = !DILocation(line: 51, column: 1, scope: !107)
!130 = distinct !DISubprogram(name: "callvsnprintf_s", scope: !10, file: !10, line: 54, type: !11, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!131 = !DILocalVariable(name: "buf", arg: 1, scope: !130, file: !10, line: 54, type: !14)
!132 = !DILocation(line: 54, column: 27, scope: !130)
!133 = !DILocalVariable(name: "destMax", arg: 2, scope: !130, file: !10, line: 54, type: !16)
!134 = !DILocation(line: 54, column: 39, scope: !130)
!135 = !DILocalVariable(name: "count", arg: 3, scope: !130, file: !10, line: 54, type: !16)
!136 = !DILocation(line: 54, column: 55, scope: !130)
!137 = !DILocalVariable(name: "format", arg: 4, scope: !130, file: !10, line: 54, type: !14)
!138 = !DILocation(line: 54, column: 68, scope: !130)
!139 = !DILocalVariable(name: "ret", scope: !130, file: !10, line: 56, type: !13)
!140 = !DILocation(line: 56, column: 9, scope: !130)
!141 = !DILocalVariable(name: "arglist", scope: !130, file: !10, line: 57, type: !33)
!142 = !DILocation(line: 57, column: 13, scope: !130)
!143 = !DILocation(line: 58, column: 5, scope: !130)
!144 = !DILocation(line: 59, column: 27, scope: !130)
!145 = !DILocation(line: 59, column: 32, scope: !130)
!146 = !DILocation(line: 59, column: 41, scope: !130)
!147 = !DILocation(line: 59, column: 48, scope: !130)
!148 = !DILocation(line: 59, column: 56, scope: !130)
!149 = !DILocation(line: 59, column: 11, scope: !130)
!150 = !DILocation(line: 59, column: 9, scope: !130)
!151 = !DILocation(line: 60, column: 5, scope: !130)
!152 = !DILocation(line: 61, column: 12, scope: !130)
!153 = !DILocation(line: 61, column: 5, scope: !130)
!154 = distinct !DISubprogram(name: "cwe120_c_217", scope: !10, file: !10, line: 67, type: !59, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!155 = !DILocalVariable(name: "buf", arg: 1, scope: !154, file: !10, line: 67, type: !14)
!156 = !DILocation(line: 67, column: 25, scope: !154)
!157 = !DILocalVariable(name: "bufSize", arg: 2, scope: !154, file: !10, line: 67, type: !16)
!158 = !DILocation(line: 67, column: 37, scope: !154)
!159 = !DILocalVariable(name: "msg", arg: 3, scope: !154, file: !10, line: 67, type: !14)
!160 = !DILocation(line: 67, column: 52, scope: !154)
!161 = !DILocalVariable(name: "len", scope: !154, file: !10, line: 69, type: !16)
!162 = !DILocation(line: 69, column: 12, scope: !154)
!163 = !DILocation(line: 69, column: 25, scope: !154)
!164 = !DILocation(line: 69, column: 18, scope: !154)
!165 = !DILocalVariable(name: "count", scope: !154, file: !10, line: 70, type: !16)
!166 = !DILocation(line: 70, column: 12, scope: !154)
!167 = !DILocation(line: 70, column: 21, scope: !154)
!168 = !DILocation(line: 70, column: 25, scope: !154)
!169 = !DILocation(line: 70, column: 31, scope: !154)
!170 = !DILocation(line: 70, column: 35, scope: !154)
!171 = !DILocation(line: 72, column: 21, scope: !154)
!172 = !DILocation(line: 72, column: 26, scope: !154)
!173 = !DILocation(line: 72, column: 31, scope: !154)
!174 = !DILocation(line: 72, column: 44, scope: !154)
!175 = !DILocation(line: 72, column: 5, scope: !154)
!176 = !DILocation(line: 73, column: 1, scope: !154)
!177 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 74, type: !178, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!178 = !DISubroutineType(types: !179)
!179 = !{!13, !13, !180}
!180 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!181 = !DILocalVariable(name: "argc", arg: 1, scope: !177, file: !10, line: 74, type: !13)
!182 = !DILocation(line: 74, column: 14, scope: !177)
!183 = !DILocalVariable(name: "argv", arg: 2, scope: !177, file: !10, line: 74, type: !180)
!184 = !DILocation(line: 74, column: 27, scope: !177)
!185 = !DILocalVariable(name: "buf", scope: !177, file: !10, line: 76, type: !186)
!186 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 128, elements: !187)
!187 = !{!188}
!188 = !DISubrange(count: 16)
!189 = !DILocation(line: 76, column: 10, scope: !177)
!190 = !DILocation(line: 77, column: 9, scope: !191)
!191 = distinct !DILexicalBlock(scope: !177, file: !10, line: 77, column: 9)
!192 = !DILocation(line: 77, column: 14, scope: !191)
!193 = !DILocation(line: 77, column: 9, scope: !177)
!194 = !DILocation(line: 78, column: 22, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !10, line: 77, column: 19)
!196 = !DILocation(line: 78, column: 40, scope: !195)
!197 = !DILocation(line: 78, column: 9, scope: !195)
!198 = !DILocation(line: 79, column: 22, scope: !195)
!199 = !DILocation(line: 79, column: 40, scope: !195)
!200 = !DILocation(line: 79, column: 9, scope: !195)
!201 = !DILocation(line: 80, column: 22, scope: !195)
!202 = !DILocation(line: 80, column: 40, scope: !195)
!203 = !DILocation(line: 80, column: 9, scope: !195)
!204 = !DILocation(line: 81, column: 5, scope: !195)
!205 = !DILocation(line: 82, column: 5, scope: !177)
