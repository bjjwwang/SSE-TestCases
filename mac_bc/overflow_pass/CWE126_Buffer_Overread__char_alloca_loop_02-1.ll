; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_loop_02_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 50, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !26
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !26
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !29
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !29
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !30
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !30
  store i8 0, i8* %arrayidx2, align 1, !dbg !31
  %10 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  store i8* %10, i8** %data, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx3, align 1, !dbg !53
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !55
  store i64 %call5, i64* %destLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !60
  %12 = load i64, i64* %destLen, align 8, !dbg !62
  %cmp = icmp ult i64 %11, %12, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %13 = load i8*, i8** %data, align 8, !dbg !65
  %14 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx6 = getelementptr inbounds i8, i8* %13, i64 %14, !dbg !65
  %15 = load i8, i8* %arrayidx6, align 1, !dbg !65
  %16 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %16, !dbg !69
  store i8 %15, i8* %arrayidx7, align 1, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %17, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !77
  store i8 0, i8* %arrayidx8, align 1, !dbg !78
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !79
  call void @printLine(i8* noundef %arraydecay9), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_loop_02_good() #0 !dbg !82 {
entry:
  call void @goodG2B1(), !dbg !83
  call void @goodG2B2(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* noundef null), !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 noundef %conv), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE126_Buffer_Overread__char_alloca_loop_02_good(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE126_Buffer_Overread__char_alloca_loop_02_bad(), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 50, align 16, !dbg !110
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %1 = alloca i8, i64 100, align 16, !dbg !113
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !112
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !114
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !114
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !114
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !114
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !117
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !117
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !117
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !117
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !118
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !118
  store i8 0, i8* %arrayidx2, align 1, !dbg !119
  %10 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !120
  store i8* %10, i8** %data, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !129, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !131
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !132
  store i8 0, i8* %arrayidx3, align 1, !dbg !133
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !134
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !135
  store i64 %call5, i64* %destLen, align 8, !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !140
  %12 = load i64, i64* %destLen, align 8, !dbg !142
  %cmp = icmp ult i64 %11, %12, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %13 = load i8*, i8** %data, align 8, !dbg !145
  %14 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx6 = getelementptr inbounds i8, i8* %13, i64 %14, !dbg !145
  %15 = load i8, i8* %arrayidx6, align 1, !dbg !145
  %16 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %16, !dbg !149
  store i8 %15, i8* %arrayidx7, align 1, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %17, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !156
  store i8 0, i8* %arrayidx8, align 1, !dbg !157
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !158
  call void @printLine(i8* noundef %arraydecay9), !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !161 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !164, metadata !DIExpression()), !dbg !165
  %0 = alloca i8, i64 50, align 16, !dbg !166
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !165
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !167, metadata !DIExpression()), !dbg !168
  %1 = alloca i8, i64 100, align 16, !dbg !169
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !168
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !170
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !170
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !170
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !170
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !171
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !171
  store i8 0, i8* %arrayidx, align 1, !dbg !172
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !173
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !173
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !173
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !173
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !174
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !174
  store i8 0, i8* %arrayidx2, align 1, !dbg !175
  %10 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !176
  store i8* %10, i8** %data, align 8, !dbg !179
  call void @llvm.dbg.declare(metadata i64* %i, metadata !180, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !183, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !185, metadata !DIExpression()), !dbg !186
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !187
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !187
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !188
  store i8 0, i8* %arrayidx3, align 1, !dbg !189
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !190
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !191
  store i64 %call5, i64* %destLen, align 8, !dbg !192
  store i64 0, i64* %i, align 8, !dbg !193
  br label %for.cond, !dbg !195

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !196
  %12 = load i64, i64* %destLen, align 8, !dbg !198
  %cmp = icmp ult i64 %11, %12, !dbg !199
  br i1 %cmp, label %for.body, label %for.end, !dbg !200

for.body:                                         ; preds = %for.cond
  %13 = load i8*, i8** %data, align 8, !dbg !201
  %14 = load i64, i64* %i, align 8, !dbg !203
  %arrayidx6 = getelementptr inbounds i8, i8* %13, i64 %14, !dbg !201
  %15 = load i8, i8* %arrayidx6, align 1, !dbg !201
  %16 = load i64, i64* %i, align 8, !dbg !204
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %16, !dbg !205
  store i8 %15, i8* %arrayidx7, align 1, !dbg !206
  br label %for.inc, !dbg !207

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !208
  %inc = add i64 %17, 1, !dbg !208
  store i64 %inc, i64* %i, align 8, !dbg !208
  br label %for.cond, !dbg !209, !llvm.loop !210

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !212
  store i8 0, i8* %arrayidx8, align 1, !dbg !213
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !214
  call void @printLine(i8* noundef %arraydecay9), !dbg !215
  ret void, !dbg !216
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_02_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !3)
!24 = !DILocation(line: 27, column: 12, scope: !13)
!25 = !DILocation(line: 27, column: 37, scope: !13)
!26 = !DILocation(line: 28, column: 5, scope: !13)
!27 = !DILocation(line: 29, column: 5, scope: !13)
!28 = !DILocation(line: 29, column: 25, scope: !13)
!29 = !DILocation(line: 30, column: 5, scope: !13)
!30 = !DILocation(line: 31, column: 5, scope: !13)
!31 = !DILocation(line: 31, column: 27, scope: !13)
!32 = !DILocation(line: 35, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !14, line: 33, column: 5)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 8)
!35 = !DILocation(line: 35, column: 14, scope: !33)
!36 = !DILocalVariable(name: "i", scope: !37, file: !14, line: 38, type: !38)
!37 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 31, baseType: !40)
!39 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !41, line: 94, baseType: !42)
!41 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 38, column: 16, scope: !37)
!44 = !DILocalVariable(name: "destLen", scope: !37, file: !14, line: 38, type: !38)
!45 = !DILocation(line: 38, column: 19, scope: !37)
!46 = !DILocalVariable(name: "dest", scope: !37, file: !14, line: 39, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 39, column: 14, scope: !37)
!51 = !DILocation(line: 40, column: 9, scope: !37)
!52 = !DILocation(line: 41, column: 9, scope: !37)
!53 = !DILocation(line: 41, column: 21, scope: !37)
!54 = !DILocation(line: 42, column: 26, scope: !37)
!55 = !DILocation(line: 42, column: 19, scope: !37)
!56 = !DILocation(line: 42, column: 17, scope: !37)
!57 = !DILocation(line: 45, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !37, file: !14, line: 45, column: 9)
!59 = !DILocation(line: 45, column: 14, scope: !58)
!60 = !DILocation(line: 45, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !14, line: 45, column: 9)
!62 = !DILocation(line: 45, column: 25, scope: !61)
!63 = !DILocation(line: 45, column: 23, scope: !61)
!64 = !DILocation(line: 45, column: 9, scope: !58)
!65 = !DILocation(line: 47, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !14, line: 46, column: 9)
!67 = !DILocation(line: 47, column: 28, scope: !66)
!68 = !DILocation(line: 47, column: 18, scope: !66)
!69 = !DILocation(line: 47, column: 13, scope: !66)
!70 = !DILocation(line: 47, column: 21, scope: !66)
!71 = !DILocation(line: 48, column: 9, scope: !66)
!72 = !DILocation(line: 45, column: 35, scope: !61)
!73 = !DILocation(line: 45, column: 9, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 48, column: 9, scope: !58)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 49, column: 9, scope: !37)
!78 = !DILocation(line: 49, column: 21, scope: !37)
!79 = !DILocation(line: 50, column: 19, scope: !37)
!80 = !DILocation(line: 50, column: 9, scope: !37)
!81 = !DILocation(line: 52, column: 1, scope: !13)
!82 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_02_good", scope: !14, file: !14, line: 127, type: !15, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!83 = !DILocation(line: 129, column: 5, scope: !82)
!84 = !DILocation(line: 130, column: 5, scope: !82)
!85 = !DILocation(line: 131, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 143, type: !87, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!87 = !DISubroutineType(types: !88)
!88 = !{!89, !89, !90}
!89 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !14, line: 143, type: !89)
!92 = !DILocation(line: 143, column: 14, scope: !86)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !14, line: 143, type: !90)
!94 = !DILocation(line: 143, column: 27, scope: !86)
!95 = !DILocation(line: 146, column: 22, scope: !86)
!96 = !DILocation(line: 146, column: 12, scope: !86)
!97 = !DILocation(line: 146, column: 5, scope: !86)
!98 = !DILocation(line: 148, column: 5, scope: !86)
!99 = !DILocation(line: 149, column: 5, scope: !86)
!100 = !DILocation(line: 150, column: 5, scope: !86)
!101 = !DILocation(line: 153, column: 5, scope: !86)
!102 = !DILocation(line: 154, column: 5, scope: !86)
!103 = !DILocation(line: 155, column: 5, scope: !86)
!104 = !DILocation(line: 157, column: 5, scope: !86)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!106 = !DILocalVariable(name: "data", scope: !105, file: !14, line: 61, type: !3)
!107 = !DILocation(line: 61, column: 12, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !14, line: 62, type: !3)
!109 = !DILocation(line: 62, column: 12, scope: !105)
!110 = !DILocation(line: 62, column: 36, scope: !105)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !14, line: 63, type: !3)
!112 = !DILocation(line: 63, column: 12, scope: !105)
!113 = !DILocation(line: 63, column: 37, scope: !105)
!114 = !DILocation(line: 64, column: 5, scope: !105)
!115 = !DILocation(line: 65, column: 5, scope: !105)
!116 = !DILocation(line: 65, column: 25, scope: !105)
!117 = !DILocation(line: 66, column: 5, scope: !105)
!118 = !DILocation(line: 67, column: 5, scope: !105)
!119 = !DILocation(line: 67, column: 27, scope: !105)
!120 = !DILocation(line: 76, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !122, file: !14, line: 74, column: 5)
!122 = distinct !DILexicalBlock(scope: !105, file: !14, line: 68, column: 8)
!123 = !DILocation(line: 76, column: 14, scope: !121)
!124 = !DILocalVariable(name: "i", scope: !125, file: !14, line: 79, type: !38)
!125 = distinct !DILexicalBlock(scope: !105, file: !14, line: 78, column: 5)
!126 = !DILocation(line: 79, column: 16, scope: !125)
!127 = !DILocalVariable(name: "destLen", scope: !125, file: !14, line: 79, type: !38)
!128 = !DILocation(line: 79, column: 19, scope: !125)
!129 = !DILocalVariable(name: "dest", scope: !125, file: !14, line: 80, type: !47)
!130 = !DILocation(line: 80, column: 14, scope: !125)
!131 = !DILocation(line: 81, column: 9, scope: !125)
!132 = !DILocation(line: 82, column: 9, scope: !125)
!133 = !DILocation(line: 82, column: 21, scope: !125)
!134 = !DILocation(line: 83, column: 26, scope: !125)
!135 = !DILocation(line: 83, column: 19, scope: !125)
!136 = !DILocation(line: 83, column: 17, scope: !125)
!137 = !DILocation(line: 86, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !125, file: !14, line: 86, column: 9)
!139 = !DILocation(line: 86, column: 14, scope: !138)
!140 = !DILocation(line: 86, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !14, line: 86, column: 9)
!142 = !DILocation(line: 86, column: 25, scope: !141)
!143 = !DILocation(line: 86, column: 23, scope: !141)
!144 = !DILocation(line: 86, column: 9, scope: !138)
!145 = !DILocation(line: 88, column: 23, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !14, line: 87, column: 9)
!147 = !DILocation(line: 88, column: 28, scope: !146)
!148 = !DILocation(line: 88, column: 18, scope: !146)
!149 = !DILocation(line: 88, column: 13, scope: !146)
!150 = !DILocation(line: 88, column: 21, scope: !146)
!151 = !DILocation(line: 89, column: 9, scope: !146)
!152 = !DILocation(line: 86, column: 35, scope: !141)
!153 = !DILocation(line: 86, column: 9, scope: !141)
!154 = distinct !{!154, !144, !155, !76}
!155 = !DILocation(line: 89, column: 9, scope: !138)
!156 = !DILocation(line: 90, column: 9, scope: !125)
!157 = !DILocation(line: 90, column: 21, scope: !125)
!158 = !DILocation(line: 91, column: 19, scope: !125)
!159 = !DILocation(line: 91, column: 9, scope: !125)
!160 = !DILocation(line: 93, column: 1, scope: !105)
!161 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 96, type: !15, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!162 = !DILocalVariable(name: "data", scope: !161, file: !14, line: 98, type: !3)
!163 = !DILocation(line: 98, column: 12, scope: !161)
!164 = !DILocalVariable(name: "dataBadBuffer", scope: !161, file: !14, line: 99, type: !3)
!165 = !DILocation(line: 99, column: 12, scope: !161)
!166 = !DILocation(line: 99, column: 36, scope: !161)
!167 = !DILocalVariable(name: "dataGoodBuffer", scope: !161, file: !14, line: 100, type: !3)
!168 = !DILocation(line: 100, column: 12, scope: !161)
!169 = !DILocation(line: 100, column: 37, scope: !161)
!170 = !DILocation(line: 101, column: 5, scope: !161)
!171 = !DILocation(line: 102, column: 5, scope: !161)
!172 = !DILocation(line: 102, column: 25, scope: !161)
!173 = !DILocation(line: 103, column: 5, scope: !161)
!174 = !DILocation(line: 104, column: 5, scope: !161)
!175 = !DILocation(line: 104, column: 27, scope: !161)
!176 = !DILocation(line: 108, column: 16, scope: !177)
!177 = distinct !DILexicalBlock(scope: !178, file: !14, line: 106, column: 5)
!178 = distinct !DILexicalBlock(scope: !161, file: !14, line: 105, column: 8)
!179 = !DILocation(line: 108, column: 14, scope: !177)
!180 = !DILocalVariable(name: "i", scope: !181, file: !14, line: 111, type: !38)
!181 = distinct !DILexicalBlock(scope: !161, file: !14, line: 110, column: 5)
!182 = !DILocation(line: 111, column: 16, scope: !181)
!183 = !DILocalVariable(name: "destLen", scope: !181, file: !14, line: 111, type: !38)
!184 = !DILocation(line: 111, column: 19, scope: !181)
!185 = !DILocalVariable(name: "dest", scope: !181, file: !14, line: 112, type: !47)
!186 = !DILocation(line: 112, column: 14, scope: !181)
!187 = !DILocation(line: 113, column: 9, scope: !181)
!188 = !DILocation(line: 114, column: 9, scope: !181)
!189 = !DILocation(line: 114, column: 21, scope: !181)
!190 = !DILocation(line: 115, column: 26, scope: !181)
!191 = !DILocation(line: 115, column: 19, scope: !181)
!192 = !DILocation(line: 115, column: 17, scope: !181)
!193 = !DILocation(line: 118, column: 16, scope: !194)
!194 = distinct !DILexicalBlock(scope: !181, file: !14, line: 118, column: 9)
!195 = !DILocation(line: 118, column: 14, scope: !194)
!196 = !DILocation(line: 118, column: 21, scope: !197)
!197 = distinct !DILexicalBlock(scope: !194, file: !14, line: 118, column: 9)
!198 = !DILocation(line: 118, column: 25, scope: !197)
!199 = !DILocation(line: 118, column: 23, scope: !197)
!200 = !DILocation(line: 118, column: 9, scope: !194)
!201 = !DILocation(line: 120, column: 23, scope: !202)
!202 = distinct !DILexicalBlock(scope: !197, file: !14, line: 119, column: 9)
!203 = !DILocation(line: 120, column: 28, scope: !202)
!204 = !DILocation(line: 120, column: 18, scope: !202)
!205 = !DILocation(line: 120, column: 13, scope: !202)
!206 = !DILocation(line: 120, column: 21, scope: !202)
!207 = !DILocation(line: 121, column: 9, scope: !202)
!208 = !DILocation(line: 118, column: 35, scope: !197)
!209 = !DILocation(line: 118, column: 9, scope: !197)
!210 = distinct !{!210, !200, !211, !76}
!211 = !DILocation(line: 121, column: 9, scope: !194)
!212 = !DILocation(line: 122, column: 9, scope: !181)
!213 = !DILocation(line: 122, column: 21, scope: !181)
!214 = !DILocation(line: 123, column: 19, scope: !181)
!215 = !DILocation(line: 123, column: 9, scope: !181)
!216 = !DILocation(line: 125, column: 1, scope: !161)
