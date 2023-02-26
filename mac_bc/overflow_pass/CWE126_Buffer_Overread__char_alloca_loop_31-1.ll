; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_loop_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data3 = alloca i8*, align 8
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
  store i8* %10, i8** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !34, metadata !DIExpression()), !dbg !36
  %11 = load i8*, i8** %data, align 8, !dbg !37
  store i8* %11, i8** %dataCopy, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !38, metadata !DIExpression()), !dbg !39
  %12 = load i8*, i8** %dataCopy, align 8, !dbg !40
  store i8* %12, i8** %data3, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !51, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !56
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !57
  store i8 0, i8* %arrayidx4, align 1, !dbg !58
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !59
  %call6 = call i64 @strlen(i8* noundef %arraydecay5), !dbg !60
  store i64 %call6, i64* %destLen, align 8, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %entry
  %13 = load i64, i64* %i, align 8, !dbg !65
  %14 = load i64, i64* %destLen, align 8, !dbg !67
  %cmp = icmp ult i64 %13, %14, !dbg !68
  br i1 %cmp, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %15 = load i8*, i8** %data3, align 8, !dbg !70
  %16 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx7 = getelementptr inbounds i8, i8* %15, i64 %16, !dbg !70
  %17 = load i8, i8* %arrayidx7, align 1, !dbg !70
  %18 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %18, !dbg !74
  store i8 %17, i8* %arrayidx8, align 1, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %19 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %19, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !82
  store i8 0, i8* %arrayidx9, align 1, !dbg !83
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !84
  call void @printLine(i8* noundef %arraydecay10), !dbg !85
  ret void, !dbg !86
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
define void @CWE126_Buffer_Overread__char_alloca_loop_31_good() #0 !dbg !87 {
entry:
  call void @goodG2B(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* noundef null), !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 noundef %conv), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE126_Buffer_Overread__char_alloca_loop_31_good(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE126_Buffer_Overread__char_alloca_loop_31_bad(), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 50, align 16, !dbg !114
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %1 = alloca i8, i64 100, align 16, !dbg !117
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !116
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !118
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !118
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !118
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !118
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !121
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !121
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !121
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !121
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !122
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !122
  store i8 0, i8* %arrayidx2, align 1, !dbg !123
  %10 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !124
  store i8* %10, i8** %data, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !126, metadata !DIExpression()), !dbg !128
  %11 = load i8*, i8** %data, align 8, !dbg !129
  store i8* %11, i8** %dataCopy, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !130, metadata !DIExpression()), !dbg !131
  %12 = load i8*, i8** %dataCopy, align 8, !dbg !132
  store i8* %12, i8** %data3, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !140
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !141
  store i8 0, i8* %arrayidx4, align 1, !dbg !142
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !143
  %call6 = call i64 @strlen(i8* noundef %arraydecay5), !dbg !144
  store i64 %call6, i64* %destLen, align 8, !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %entry
  %13 = load i64, i64* %i, align 8, !dbg !149
  %14 = load i64, i64* %destLen, align 8, !dbg !151
  %cmp = icmp ult i64 %13, %14, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %15 = load i8*, i8** %data3, align 8, !dbg !154
  %16 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx7 = getelementptr inbounds i8, i8* %15, i64 %16, !dbg !154
  %17 = load i8, i8* %arrayidx7, align 1, !dbg !154
  %18 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %18, !dbg !158
  store i8 %17, i8* %arrayidx8, align 1, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %19 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %19, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !165
  store i8 0, i8* %arrayidx9, align 1, !dbg !166
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !167
  call void @printLine(i8* noundef %arraydecay10), !dbg !168
  ret void, !dbg !169
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_31_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!32 = !DILocation(line: 33, column: 12, scope: !13)
!33 = !DILocation(line: 33, column: 10, scope: !13)
!34 = !DILocalVariable(name: "dataCopy", scope: !35, file: !14, line: 35, type: !3)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!36 = !DILocation(line: 35, column: 16, scope: !35)
!37 = !DILocation(line: 35, column: 27, scope: !35)
!38 = !DILocalVariable(name: "data", scope: !35, file: !14, line: 36, type: !3)
!39 = !DILocation(line: 36, column: 16, scope: !35)
!40 = !DILocation(line: 36, column: 23, scope: !35)
!41 = !DILocalVariable(name: "i", scope: !42, file: !14, line: 38, type: !43)
!42 = distinct !DILexicalBlock(scope: !35, file: !14, line: 37, column: 9)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 31, baseType: !45)
!44 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !46, line: 94, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!47 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 38, column: 20, scope: !42)
!49 = !DILocalVariable(name: "destLen", scope: !42, file: !14, line: 38, type: !43)
!50 = !DILocation(line: 38, column: 23, scope: !42)
!51 = !DILocalVariable(name: "dest", scope: !42, file: !14, line: 39, type: !52)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 39, column: 18, scope: !42)
!56 = !DILocation(line: 40, column: 13, scope: !42)
!57 = !DILocation(line: 41, column: 13, scope: !42)
!58 = !DILocation(line: 41, column: 25, scope: !42)
!59 = !DILocation(line: 42, column: 30, scope: !42)
!60 = !DILocation(line: 42, column: 23, scope: !42)
!61 = !DILocation(line: 42, column: 21, scope: !42)
!62 = !DILocation(line: 45, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !42, file: !14, line: 45, column: 13)
!64 = !DILocation(line: 45, column: 18, scope: !63)
!65 = !DILocation(line: 45, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !14, line: 45, column: 13)
!67 = !DILocation(line: 45, column: 29, scope: !66)
!68 = !DILocation(line: 45, column: 27, scope: !66)
!69 = !DILocation(line: 45, column: 13, scope: !63)
!70 = !DILocation(line: 47, column: 27, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !14, line: 46, column: 13)
!72 = !DILocation(line: 47, column: 32, scope: !71)
!73 = !DILocation(line: 47, column: 22, scope: !71)
!74 = !DILocation(line: 47, column: 17, scope: !71)
!75 = !DILocation(line: 47, column: 25, scope: !71)
!76 = !DILocation(line: 48, column: 13, scope: !71)
!77 = !DILocation(line: 45, column: 39, scope: !66)
!78 = !DILocation(line: 45, column: 13, scope: !66)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 48, column: 13, scope: !63)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 49, column: 13, scope: !42)
!83 = !DILocation(line: 49, column: 25, scope: !42)
!84 = !DILocation(line: 50, column: 23, scope: !42)
!85 = !DILocation(line: 50, column: 13, scope: !42)
!86 = !DILocation(line: 53, column: 1, scope: !13)
!87 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_31_good", scope: !14, file: !14, line: 92, type: !15, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!88 = !DILocation(line: 94, column: 5, scope: !87)
!89 = !DILocation(line: 95, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 106, type: !91, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!91 = !DISubroutineType(types: !92)
!92 = !{!93, !93, !94}
!93 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !14, line: 106, type: !93)
!96 = !DILocation(line: 106, column: 14, scope: !90)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !14, line: 106, type: !94)
!98 = !DILocation(line: 106, column: 27, scope: !90)
!99 = !DILocation(line: 109, column: 22, scope: !90)
!100 = !DILocation(line: 109, column: 12, scope: !90)
!101 = !DILocation(line: 109, column: 5, scope: !90)
!102 = !DILocation(line: 111, column: 5, scope: !90)
!103 = !DILocation(line: 112, column: 5, scope: !90)
!104 = !DILocation(line: 113, column: 5, scope: !90)
!105 = !DILocation(line: 116, column: 5, scope: !90)
!106 = !DILocation(line: 117, column: 5, scope: !90)
!107 = !DILocation(line: 118, column: 5, scope: !90)
!108 = !DILocation(line: 120, column: 5, scope: !90)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!110 = !DILocalVariable(name: "data", scope: !109, file: !14, line: 62, type: !3)
!111 = !DILocation(line: 62, column: 12, scope: !109)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !14, line: 63, type: !3)
!113 = !DILocation(line: 63, column: 12, scope: !109)
!114 = !DILocation(line: 63, column: 36, scope: !109)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !14, line: 64, type: !3)
!116 = !DILocation(line: 64, column: 12, scope: !109)
!117 = !DILocation(line: 64, column: 37, scope: !109)
!118 = !DILocation(line: 65, column: 5, scope: !109)
!119 = !DILocation(line: 66, column: 5, scope: !109)
!120 = !DILocation(line: 66, column: 25, scope: !109)
!121 = !DILocation(line: 67, column: 5, scope: !109)
!122 = !DILocation(line: 68, column: 5, scope: !109)
!123 = !DILocation(line: 68, column: 27, scope: !109)
!124 = !DILocation(line: 70, column: 12, scope: !109)
!125 = !DILocation(line: 70, column: 10, scope: !109)
!126 = !DILocalVariable(name: "dataCopy", scope: !127, file: !14, line: 72, type: !3)
!127 = distinct !DILexicalBlock(scope: !109, file: !14, line: 71, column: 5)
!128 = !DILocation(line: 72, column: 16, scope: !127)
!129 = !DILocation(line: 72, column: 27, scope: !127)
!130 = !DILocalVariable(name: "data", scope: !127, file: !14, line: 73, type: !3)
!131 = !DILocation(line: 73, column: 16, scope: !127)
!132 = !DILocation(line: 73, column: 23, scope: !127)
!133 = !DILocalVariable(name: "i", scope: !134, file: !14, line: 75, type: !43)
!134 = distinct !DILexicalBlock(scope: !127, file: !14, line: 74, column: 9)
!135 = !DILocation(line: 75, column: 20, scope: !134)
!136 = !DILocalVariable(name: "destLen", scope: !134, file: !14, line: 75, type: !43)
!137 = !DILocation(line: 75, column: 23, scope: !134)
!138 = !DILocalVariable(name: "dest", scope: !134, file: !14, line: 76, type: !52)
!139 = !DILocation(line: 76, column: 18, scope: !134)
!140 = !DILocation(line: 77, column: 13, scope: !134)
!141 = !DILocation(line: 78, column: 13, scope: !134)
!142 = !DILocation(line: 78, column: 25, scope: !134)
!143 = !DILocation(line: 79, column: 30, scope: !134)
!144 = !DILocation(line: 79, column: 23, scope: !134)
!145 = !DILocation(line: 79, column: 21, scope: !134)
!146 = !DILocation(line: 82, column: 20, scope: !147)
!147 = distinct !DILexicalBlock(scope: !134, file: !14, line: 82, column: 13)
!148 = !DILocation(line: 82, column: 18, scope: !147)
!149 = !DILocation(line: 82, column: 25, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !14, line: 82, column: 13)
!151 = !DILocation(line: 82, column: 29, scope: !150)
!152 = !DILocation(line: 82, column: 27, scope: !150)
!153 = !DILocation(line: 82, column: 13, scope: !147)
!154 = !DILocation(line: 84, column: 27, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !14, line: 83, column: 13)
!156 = !DILocation(line: 84, column: 32, scope: !155)
!157 = !DILocation(line: 84, column: 22, scope: !155)
!158 = !DILocation(line: 84, column: 17, scope: !155)
!159 = !DILocation(line: 84, column: 25, scope: !155)
!160 = !DILocation(line: 85, column: 13, scope: !155)
!161 = !DILocation(line: 82, column: 39, scope: !150)
!162 = !DILocation(line: 82, column: 13, scope: !150)
!163 = distinct !{!163, !153, !164, !81}
!164 = !DILocation(line: 85, column: 13, scope: !147)
!165 = !DILocation(line: 86, column: 13, scope: !134)
!166 = !DILocation(line: 86, column: 25, scope: !134)
!167 = !DILocation(line: 87, column: 23, scope: !134)
!168 = !DILocation(line: 87, column: 13, scope: !134)
!169 = !DILocation(line: 90, column: 1, scope: !109)
