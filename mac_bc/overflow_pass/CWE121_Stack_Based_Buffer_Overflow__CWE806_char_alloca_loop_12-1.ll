; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 100, align 16, !dbg !22
  store i8* %0, i8** %dataBuffer, align 8, !dbg !21
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !23
  store i8* %1, i8** %data, align 8, !dbg !24
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.else, !dbg !27

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !28
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !28
  %call1 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #5, !dbg !28
  %5 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  br label %if.end, !dbg !32

if.else:                                          ; preds = %entry
  %6 = load i8*, i8** %data, align 8, !dbg !33
  %7 = load i8*, i8** %data, align 8, !dbg !33
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !33
  %call2 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 49, i64 noundef %8) #5, !dbg !33
  %9 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 49, !dbg !35
  store i8 0, i8* %arrayidx3, align 1, !dbg !36
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %10 = bitcast [50 x i8]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 50, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !50, metadata !DIExpression()), !dbg !51
  %11 = load i8*, i8** %data, align 8, !dbg !52
  %call4 = call i64 @strlen(i8* noundef %11), !dbg !53
  store i64 %call4, i64* %dataLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %12 = load i64, i64* %i, align 8, !dbg !58
  %13 = load i64, i64* %dataLen, align 8, !dbg !60
  %cmp = icmp ult i64 %12, %13, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %14 = load i8*, i8** %data, align 8, !dbg !63
  %15 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds i8, i8* %14, i64 %15, !dbg !63
  %16 = load i8, i8* %arrayidx5, align 1, !dbg !63
  %17 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %17, !dbg !67
  store i8 %16, i8* %arrayidx6, align 1, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %18 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %18, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !75
  store i8 0, i8* %arrayidx7, align 1, !dbg !76
  %19 = load i8*, i8** %data, align 8, !dbg !77
  call void @printLine(i8* noundef %19), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare i64 @strlen(i8* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12_good() #0 !dbg !80 {
entry:
  call void @goodG2B(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* noundef null), !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 noundef %conv), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12_good(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12_bad(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = alloca i8, i64 100, align 16, !dbg !107
  store i8* %0, i8** %dataBuffer, align 8, !dbg !106
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  store i8* %1, i8** %data, align 8, !dbg !109
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !110
  %tobool = icmp ne i32 %call, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !113
  %3 = load i8*, i8** %data, align 8, !dbg !113
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !113
  %call1 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !113
  %5 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  br label %if.end, !dbg !117

if.else:                                          ; preds = %entry
  %6 = load i8*, i8** %data, align 8, !dbg !118
  %7 = load i8*, i8** %data, align 8, !dbg !118
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !118
  %call2 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 49, i64 noundef %8) #5, !dbg !118
  %9 = load i8*, i8** %data, align 8, !dbg !120
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 49, !dbg !120
  store i8 0, i8* %arrayidx3, align 1, !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %10 = bitcast [50 x i8]* %dest to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 50, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !127, metadata !DIExpression()), !dbg !128
  %11 = load i8*, i8** %data, align 8, !dbg !129
  %call4 = call i64 @strlen(i8* noundef %11), !dbg !130
  store i64 %call4, i64* %dataLen, align 8, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end
  %12 = load i64, i64* %i, align 8, !dbg !135
  %13 = load i64, i64* %dataLen, align 8, !dbg !137
  %cmp = icmp ult i64 %12, %13, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %14 = load i8*, i8** %data, align 8, !dbg !140
  %15 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx5 = getelementptr inbounds i8, i8* %14, i64 %15, !dbg !140
  %16 = load i8, i8* %arrayidx5, align 1, !dbg !140
  %17 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %17, !dbg !144
  store i8 %16, i8* %arrayidx6, align 1, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %18 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %18, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !151
  store i8 0, i8* %arrayidx7, align 1, !dbg !152
  %19 = load i8*, i8** %data, align 8, !dbg !153
  call void @printLine(i8* noundef %19), !dbg !154
  ret void, !dbg !155
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 33, scope: !13)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 10, scope: !13)
!25 = !DILocation(line: 28, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!27 = !DILocation(line: 28, column: 8, scope: !13)
!28 = !DILocation(line: 31, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 29, column: 5)
!30 = !DILocation(line: 32, column: 9, scope: !29)
!31 = !DILocation(line: 32, column: 21, scope: !29)
!32 = !DILocation(line: 33, column: 5, scope: !29)
!33 = !DILocation(line: 37, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !26, file: !14, line: 35, column: 5)
!35 = !DILocation(line: 38, column: 9, scope: !34)
!36 = !DILocation(line: 38, column: 20, scope: !34)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !14, line: 41, type: !39)
!38 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 41, column: 14, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !38, file: !14, line: 42, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 31, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !47, line: 94, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!48 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 42, column: 16, scope: !38)
!50 = !DILocalVariable(name: "dataLen", scope: !38, file: !14, line: 42, type: !44)
!51 = !DILocation(line: 42, column: 19, scope: !38)
!52 = !DILocation(line: 43, column: 26, scope: !38)
!53 = !DILocation(line: 43, column: 19, scope: !38)
!54 = !DILocation(line: 43, column: 17, scope: !38)
!55 = !DILocation(line: 45, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !38, file: !14, line: 45, column: 9)
!57 = !DILocation(line: 45, column: 14, scope: !56)
!58 = !DILocation(line: 45, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !14, line: 45, column: 9)
!60 = !DILocation(line: 45, column: 25, scope: !59)
!61 = !DILocation(line: 45, column: 23, scope: !59)
!62 = !DILocation(line: 45, column: 9, scope: !56)
!63 = !DILocation(line: 47, column: 23, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !14, line: 46, column: 9)
!65 = !DILocation(line: 47, column: 28, scope: !64)
!66 = !DILocation(line: 47, column: 18, scope: !64)
!67 = !DILocation(line: 47, column: 13, scope: !64)
!68 = !DILocation(line: 47, column: 21, scope: !64)
!69 = !DILocation(line: 48, column: 9, scope: !64)
!70 = !DILocation(line: 45, column: 35, scope: !59)
!71 = !DILocation(line: 45, column: 9, scope: !59)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 48, column: 9, scope: !56)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 49, column: 9, scope: !38)
!76 = !DILocation(line: 49, column: 20, scope: !38)
!77 = !DILocation(line: 50, column: 19, scope: !38)
!78 = !DILocation(line: 50, column: 9, scope: !38)
!79 = !DILocation(line: 52, column: 1, scope: !13)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12_good", scope: !14, file: !14, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!81 = !DILocation(line: 93, column: 5, scope: !80)
!82 = !DILocation(line: 94, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 106, type: !84, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!84 = !DISubroutineType(types: !85)
!85 = !{!86, !86, !87}
!86 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !14, line: 106, type: !86)
!89 = !DILocation(line: 106, column: 14, scope: !83)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !14, line: 106, type: !87)
!91 = !DILocation(line: 106, column: 27, scope: !83)
!92 = !DILocation(line: 109, column: 22, scope: !83)
!93 = !DILocation(line: 109, column: 12, scope: !83)
!94 = !DILocation(line: 109, column: 5, scope: !83)
!95 = !DILocation(line: 111, column: 5, scope: !83)
!96 = !DILocation(line: 112, column: 5, scope: !83)
!97 = !DILocation(line: 113, column: 5, scope: !83)
!98 = !DILocation(line: 116, column: 5, scope: !83)
!99 = !DILocation(line: 117, column: 5, scope: !83)
!100 = !DILocation(line: 118, column: 5, scope: !83)
!101 = !DILocation(line: 120, column: 5, scope: !83)
!102 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!103 = !DILocalVariable(name: "data", scope: !102, file: !14, line: 62, type: !3)
!104 = !DILocation(line: 62, column: 12, scope: !102)
!105 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !14, line: 63, type: !3)
!106 = !DILocation(line: 63, column: 12, scope: !102)
!107 = !DILocation(line: 63, column: 33, scope: !102)
!108 = !DILocation(line: 64, column: 12, scope: !102)
!109 = !DILocation(line: 64, column: 10, scope: !102)
!110 = !DILocation(line: 65, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !102, file: !14, line: 65, column: 8)
!112 = !DILocation(line: 65, column: 8, scope: !102)
!113 = !DILocation(line: 68, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !14, line: 66, column: 5)
!115 = !DILocation(line: 69, column: 9, scope: !114)
!116 = !DILocation(line: 69, column: 20, scope: !114)
!117 = !DILocation(line: 70, column: 5, scope: !114)
!118 = !DILocation(line: 74, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !111, file: !14, line: 72, column: 5)
!120 = !DILocation(line: 75, column: 9, scope: !119)
!121 = !DILocation(line: 75, column: 20, scope: !119)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !14, line: 78, type: !39)
!123 = distinct !DILexicalBlock(scope: !102, file: !14, line: 77, column: 5)
!124 = !DILocation(line: 78, column: 14, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !123, file: !14, line: 79, type: !44)
!126 = !DILocation(line: 79, column: 16, scope: !123)
!127 = !DILocalVariable(name: "dataLen", scope: !123, file: !14, line: 79, type: !44)
!128 = !DILocation(line: 79, column: 19, scope: !123)
!129 = !DILocation(line: 80, column: 26, scope: !123)
!130 = !DILocation(line: 80, column: 19, scope: !123)
!131 = !DILocation(line: 80, column: 17, scope: !123)
!132 = !DILocation(line: 82, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !123, file: !14, line: 82, column: 9)
!134 = !DILocation(line: 82, column: 14, scope: !133)
!135 = !DILocation(line: 82, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !14, line: 82, column: 9)
!137 = !DILocation(line: 82, column: 25, scope: !136)
!138 = !DILocation(line: 82, column: 23, scope: !136)
!139 = !DILocation(line: 82, column: 9, scope: !133)
!140 = !DILocation(line: 84, column: 23, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !14, line: 83, column: 9)
!142 = !DILocation(line: 84, column: 28, scope: !141)
!143 = !DILocation(line: 84, column: 18, scope: !141)
!144 = !DILocation(line: 84, column: 13, scope: !141)
!145 = !DILocation(line: 84, column: 21, scope: !141)
!146 = !DILocation(line: 85, column: 9, scope: !141)
!147 = !DILocation(line: 82, column: 35, scope: !136)
!148 = !DILocation(line: 82, column: 9, scope: !136)
!149 = distinct !{!149, !139, !150, !74}
!150 = !DILocation(line: 85, column: 9, scope: !133)
!151 = !DILocation(line: 86, column: 9, scope: !123)
!152 = !DILocation(line: 86, column: 20, scope: !123)
!153 = !DILocation(line: 87, column: 19, scope: !123)
!154 = !DILocation(line: 87, column: 9, scope: !123)
!155 = !DILocation(line: 89, column: 1, scope: !102)
