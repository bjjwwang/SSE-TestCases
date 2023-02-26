; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !9

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 100, align 16, !dbg !27
  store i8* %0, i8** %dataBuffer, align 8, !dbg !26
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !28
  store i8* %1, i8** %data, align 8, !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !30
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !30
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #5, !dbg !30
  %5 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %6 = load i8*, i8** %data, align 8, !dbg !33
  store i8* %6, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_badData, align 8, !dbg !34
  call void @badSink(), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_good() #0 !dbg !37 {
entry:
  call void @goodG2B(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i64 @time(i64* noundef null), !dbg !49
  %conv = trunc i64 %call to i32, !dbg !50
  call void @srand(i32 noundef %conv), !dbg !51
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_good(), !dbg !53
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_bad(), !dbg !56
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !59 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !DIExpression()), !dbg !61
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_badData, align 8, !dbg !62
  store i8* %0, i8** %data, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !63, metadata !DIExpression()), !dbg !68
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !68
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !68
  call void @llvm.dbg.declare(metadata i64* %i, metadata !69, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !76, metadata !DIExpression()), !dbg !77
  %2 = load i8*, i8** %data, align 8, !dbg !78
  %call = call i64 @strlen(i8* noundef %2), !dbg !79
  store i64 %call, i64* %dataLen, align 8, !dbg !80
  store i64 0, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !84
  %4 = load i64, i64* %dataLen, align 8, !dbg !86
  %cmp = icmp ult i64 %3, %4, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !89
  %6 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !89
  %7 = load i8, i8* %arrayidx, align 1, !dbg !89
  %8 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !93
  store i8 %7, i8* %arrayidx1, align 1, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %9, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !101
  store i8 0, i8* %arrayidx2, align 1, !dbg !102
  %10 = load i8*, i8** %data, align 8, !dbg !103
  call void @printLine(i8* noundef %10), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare i64 @strlen(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = alloca i8, i64 100, align 16, !dbg !111
  store i8* %0, i8** %dataBuffer, align 8, !dbg !110
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !112
  store i8* %1, i8** %data, align 8, !dbg !113
  %2 = load i8*, i8** %data, align 8, !dbg !114
  %3 = load i8*, i8** %data, align 8, !dbg !114
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !114
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !114
  %5 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %6 = load i8*, i8** %data, align 8, !dbg !117
  store i8* %6, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_goodG2BData, align 8, !dbg !118
  call void @goodG2BSink(), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !121 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !122, metadata !DIExpression()), !dbg !123
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_goodG2BData, align 8, !dbg !124
  store i8* %0, i8** %data, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !125, metadata !DIExpression()), !dbg !127
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !130, metadata !DIExpression()), !dbg !131
  %2 = load i8*, i8** %data, align 8, !dbg !132
  %call = call i64 @strlen(i8* noundef %2), !dbg !133
  store i64 %call, i64* %dataLen, align 8, !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !138
  %4 = load i64, i64* %dataLen, align 8, !dbg !140
  %cmp = icmp ult i64 %3, %4, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !143
  %6 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !143
  %7 = load i8, i8* %arrayidx, align 1, !dbg !143
  %8 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !147
  store i8 %7, i8* %arrayidx1, align 1, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %9, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !154
  store i8 0, i8* %arrayidx2, align 1, !dbg !155
  %10 = load i8*, i8** %data, align 8, !dbg !156
  call void @printLine(i8* noundef %10), !dbg !157
  ret void, !dbg !158
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_badData", scope: !2, file: !11, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_goodG2BData", scope: !2, file: !11, line: 22, type: !5, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_bad", scope: !11, file: !11, line: 43, type: !20, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 45, type: !5)
!24 = !DILocation(line: 45, column: 12, scope: !19)
!25 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !11, line: 46, type: !5)
!26 = !DILocation(line: 46, column: 12, scope: !19)
!27 = !DILocation(line: 46, column: 33, scope: !19)
!28 = !DILocation(line: 47, column: 12, scope: !19)
!29 = !DILocation(line: 47, column: 10, scope: !19)
!30 = !DILocation(line: 49, column: 5, scope: !19)
!31 = !DILocation(line: 50, column: 5, scope: !19)
!32 = !DILocation(line: 50, column: 17, scope: !19)
!33 = !DILocation(line: 51, column: 78, scope: !19)
!34 = !DILocation(line: 51, column: 76, scope: !19)
!35 = !DILocation(line: 52, column: 5, scope: !19)
!36 = !DILocation(line: 53, column: 1, scope: !19)
!37 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_good", scope: !11, file: !11, line: 89, type: !20, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!38 = !DILocation(line: 91, column: 5, scope: !37)
!39 = !DILocation(line: 92, column: 1, scope: !37)
!40 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 103, type: !41, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!41 = !DISubroutineType(types: !42)
!42 = !{!43, !43, !44}
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !11, line: 103, type: !43)
!46 = !DILocation(line: 103, column: 14, scope: !40)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !11, line: 103, type: !44)
!48 = !DILocation(line: 103, column: 27, scope: !40)
!49 = !DILocation(line: 106, column: 22, scope: !40)
!50 = !DILocation(line: 106, column: 12, scope: !40)
!51 = !DILocation(line: 106, column: 5, scope: !40)
!52 = !DILocation(line: 108, column: 5, scope: !40)
!53 = !DILocation(line: 109, column: 5, scope: !40)
!54 = !DILocation(line: 110, column: 5, scope: !40)
!55 = !DILocation(line: 113, column: 5, scope: !40)
!56 = !DILocation(line: 114, column: 5, scope: !40)
!57 = !DILocation(line: 115, column: 5, scope: !40)
!58 = !DILocation(line: 117, column: 5, scope: !40)
!59 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!60 = !DILocalVariable(name: "data", scope: !59, file: !11, line: 28, type: !5)
!61 = !DILocation(line: 28, column: 12, scope: !59)
!62 = !DILocation(line: 28, column: 19, scope: !59)
!63 = !DILocalVariable(name: "dest", scope: !64, file: !11, line: 30, type: !65)
!64 = distinct !DILexicalBlock(scope: !59, file: !11, line: 29, column: 5)
!65 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 400, elements: !66)
!66 = !{!67}
!67 = !DISubrange(count: 50)
!68 = !DILocation(line: 30, column: 14, scope: !64)
!69 = !DILocalVariable(name: "i", scope: !64, file: !11, line: 31, type: !70)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !71, line: 31, baseType: !72)
!71 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !73, line: 94, baseType: !74)
!73 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!74 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!75 = !DILocation(line: 31, column: 16, scope: !64)
!76 = !DILocalVariable(name: "dataLen", scope: !64, file: !11, line: 31, type: !70)
!77 = !DILocation(line: 31, column: 19, scope: !64)
!78 = !DILocation(line: 32, column: 26, scope: !64)
!79 = !DILocation(line: 32, column: 19, scope: !64)
!80 = !DILocation(line: 32, column: 17, scope: !64)
!81 = !DILocation(line: 34, column: 16, scope: !82)
!82 = distinct !DILexicalBlock(scope: !64, file: !11, line: 34, column: 9)
!83 = !DILocation(line: 34, column: 14, scope: !82)
!84 = !DILocation(line: 34, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !11, line: 34, column: 9)
!86 = !DILocation(line: 34, column: 25, scope: !85)
!87 = !DILocation(line: 34, column: 23, scope: !85)
!88 = !DILocation(line: 34, column: 9, scope: !82)
!89 = !DILocation(line: 36, column: 23, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !11, line: 35, column: 9)
!91 = !DILocation(line: 36, column: 28, scope: !90)
!92 = !DILocation(line: 36, column: 18, scope: !90)
!93 = !DILocation(line: 36, column: 13, scope: !90)
!94 = !DILocation(line: 36, column: 21, scope: !90)
!95 = !DILocation(line: 37, column: 9, scope: !90)
!96 = !DILocation(line: 34, column: 35, scope: !85)
!97 = !DILocation(line: 34, column: 9, scope: !85)
!98 = distinct !{!98, !88, !99, !100}
!99 = !DILocation(line: 37, column: 9, scope: !82)
!100 = !{!"llvm.loop.mustprogress"}
!101 = !DILocation(line: 38, column: 9, scope: !64)
!102 = !DILocation(line: 38, column: 20, scope: !64)
!103 = !DILocation(line: 39, column: 19, scope: !64)
!104 = !DILocation(line: 39, column: 9, scope: !64)
!105 = !DILocation(line: 41, column: 1, scope: !59)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 77, type: !20, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!107 = !DILocalVariable(name: "data", scope: !106, file: !11, line: 79, type: !5)
!108 = !DILocation(line: 79, column: 12, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !11, line: 80, type: !5)
!110 = !DILocation(line: 80, column: 12, scope: !106)
!111 = !DILocation(line: 80, column: 33, scope: !106)
!112 = !DILocation(line: 81, column: 12, scope: !106)
!113 = !DILocation(line: 81, column: 10, scope: !106)
!114 = !DILocation(line: 83, column: 5, scope: !106)
!115 = !DILocation(line: 84, column: 5, scope: !106)
!116 = !DILocation(line: 84, column: 16, scope: !106)
!117 = !DILocation(line: 85, column: 82, scope: !106)
!118 = !DILocation(line: 85, column: 80, scope: !106)
!119 = !DILocation(line: 86, column: 5, scope: !106)
!120 = !DILocation(line: 87, column: 1, scope: !106)
!121 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 60, type: !20, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!122 = !DILocalVariable(name: "data", scope: !121, file: !11, line: 62, type: !5)
!123 = !DILocation(line: 62, column: 12, scope: !121)
!124 = !DILocation(line: 62, column: 19, scope: !121)
!125 = !DILocalVariable(name: "dest", scope: !126, file: !11, line: 64, type: !65)
!126 = distinct !DILexicalBlock(scope: !121, file: !11, line: 63, column: 5)
!127 = !DILocation(line: 64, column: 14, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !126, file: !11, line: 65, type: !70)
!129 = !DILocation(line: 65, column: 16, scope: !126)
!130 = !DILocalVariable(name: "dataLen", scope: !126, file: !11, line: 65, type: !70)
!131 = !DILocation(line: 65, column: 19, scope: !126)
!132 = !DILocation(line: 66, column: 26, scope: !126)
!133 = !DILocation(line: 66, column: 19, scope: !126)
!134 = !DILocation(line: 66, column: 17, scope: !126)
!135 = !DILocation(line: 68, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !126, file: !11, line: 68, column: 9)
!137 = !DILocation(line: 68, column: 14, scope: !136)
!138 = !DILocation(line: 68, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !11, line: 68, column: 9)
!140 = !DILocation(line: 68, column: 25, scope: !139)
!141 = !DILocation(line: 68, column: 23, scope: !139)
!142 = !DILocation(line: 68, column: 9, scope: !136)
!143 = !DILocation(line: 70, column: 23, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !11, line: 69, column: 9)
!145 = !DILocation(line: 70, column: 28, scope: !144)
!146 = !DILocation(line: 70, column: 18, scope: !144)
!147 = !DILocation(line: 70, column: 13, scope: !144)
!148 = !DILocation(line: 70, column: 21, scope: !144)
!149 = !DILocation(line: 71, column: 9, scope: !144)
!150 = !DILocation(line: 68, column: 35, scope: !139)
!151 = !DILocation(line: 68, column: 9, scope: !139)
!152 = distinct !{!152, !142, !153, !100}
!153 = !DILocation(line: 71, column: 9, scope: !136)
!154 = !DILocation(line: 72, column: 9, scope: !126)
!155 = !DILocation(line: 72, column: 20, scope: !126)
!156 = !DILocation(line: 73, column: 19, scope: !126)
!157 = !DILocation(line: 73, column: 9, scope: !126)
!158 = !DILocation(line: 75, column: 1, scope: !121)
