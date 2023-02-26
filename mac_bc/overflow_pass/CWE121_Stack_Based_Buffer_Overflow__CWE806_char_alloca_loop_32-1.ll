; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 100, align 16, !dbg !27
  store i8* %0, i8** %dataBuffer, align 8, !dbg !26
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !28
  store i8* %1, i8** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !30, metadata !DIExpression()), !dbg !32
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !33
  %3 = load i8*, i8** %2, align 8, !dbg !34
  store i8* %3, i8** %data1, align 8, !dbg !32
  %4 = load i8*, i8** %data1, align 8, !dbg !35
  %5 = load i8*, i8** %data1, align 8, !dbg !35
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !35
  %call = call i8* @__memset_chk(i8* noundef %4, i32 noundef 65, i64 noundef 99, i64 noundef %6) #5, !dbg !35
  %7 = load i8*, i8** %data1, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 99, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %8 = load i8*, i8** %data1, align 8, !dbg !38
  %9 = load i8**, i8*** %dataPtr1, align 8, !dbg !39
  store i8* %8, i8** %9, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !41, metadata !DIExpression()), !dbg !43
  %10 = load i8**, i8*** %dataPtr2, align 8, !dbg !44
  %11 = load i8*, i8** %10, align 8, !dbg !45
  store i8* %11, i8** %data2, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %12 = bitcast [50 x i8]* %dest to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 50, i1 false), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !59, metadata !DIExpression()), !dbg !60
  %13 = load i8*, i8** %data2, align 8, !dbg !61
  %call3 = call i64 @strlen(i8* noundef %13), !dbg !62
  store i64 %call3, i64* %dataLen, align 8, !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %14 = load i64, i64* %i, align 8, !dbg !67
  %15 = load i64, i64* %dataLen, align 8, !dbg !69
  %cmp = icmp ult i64 %14, %15, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %16 = load i8*, i8** %data2, align 8, !dbg !72
  %17 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx4 = getelementptr inbounds i8, i8* %16, i64 %17, !dbg !72
  %18 = load i8, i8* %arrayidx4, align 1, !dbg !72
  %19 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %19, !dbg !76
  store i8 %18, i8* %arrayidx5, align 1, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %20 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %20, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !84
  store i8 0, i8* %arrayidx6, align 1, !dbg !85
  %21 = load i8*, i8** %data2, align 8, !dbg !86
  call void @printLine(i8* noundef %21), !dbg !87
  ret void, !dbg !88
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32_good() #0 !dbg !89 {
entry:
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* noundef null), !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 noundef %conv), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32_good(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32_bad(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !113, metadata !DIExpression()), !dbg !114
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = alloca i8, i64 100, align 16, !dbg !119
  store i8* %0, i8** %dataBuffer, align 8, !dbg !118
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !120
  store i8* %1, i8** %data, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !122, metadata !DIExpression()), !dbg !124
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !125
  %3 = load i8*, i8** %2, align 8, !dbg !126
  store i8* %3, i8** %data1, align 8, !dbg !124
  %4 = load i8*, i8** %data1, align 8, !dbg !127
  %5 = load i8*, i8** %data1, align 8, !dbg !127
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !127
  %call = call i8* @__memset_chk(i8* noundef %4, i32 noundef 65, i64 noundef 49, i64 noundef %6) #5, !dbg !127
  %7 = load i8*, i8** %data1, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 49, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  %8 = load i8*, i8** %data1, align 8, !dbg !130
  %9 = load i8**, i8*** %dataPtr1, align 8, !dbg !131
  store i8* %8, i8** %9, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !133, metadata !DIExpression()), !dbg !135
  %10 = load i8**, i8*** %dataPtr2, align 8, !dbg !136
  %11 = load i8*, i8** %10, align 8, !dbg !137
  store i8* %11, i8** %data2, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !138, metadata !DIExpression()), !dbg !140
  %12 = bitcast [50 x i8]* %dest to i8*, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 50, i1 false), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !143, metadata !DIExpression()), !dbg !144
  %13 = load i8*, i8** %data2, align 8, !dbg !145
  %call3 = call i64 @strlen(i8* noundef %13), !dbg !146
  store i64 %call3, i64* %dataLen, align 8, !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %entry
  %14 = load i64, i64* %i, align 8, !dbg !151
  %15 = load i64, i64* %dataLen, align 8, !dbg !153
  %cmp = icmp ult i64 %14, %15, !dbg !154
  br i1 %cmp, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %16 = load i8*, i8** %data2, align 8, !dbg !156
  %17 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx4 = getelementptr inbounds i8, i8* %16, i64 %17, !dbg !156
  %18 = load i8, i8* %arrayidx4, align 1, !dbg !156
  %19 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %19, !dbg !160
  store i8 %18, i8* %arrayidx5, align 1, !dbg !161
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %for.body
  %20 = load i64, i64* %i, align 8, !dbg !163
  %inc = add i64 %20, 1, !dbg !163
  store i64 %inc, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !167
  store i8 0, i8* %arrayidx6, align 1, !dbg !168
  %21 = load i8*, i8** %data2, align 8, !dbg !169
  call void @printLine(i8* noundef %21), !dbg !170
  ret void, !dbg !171
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !13)
!23 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !13)
!25 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 28, type: !3)
!26 = !DILocation(line: 28, column: 12, scope: !13)
!27 = !DILocation(line: 28, column: 33, scope: !13)
!28 = !DILocation(line: 29, column: 12, scope: !13)
!29 = !DILocation(line: 29, column: 10, scope: !13)
!30 = !DILocalVariable(name: "data", scope: !31, file: !14, line: 31, type: !3)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 5)
!32 = !DILocation(line: 31, column: 16, scope: !31)
!33 = !DILocation(line: 31, column: 24, scope: !31)
!34 = !DILocation(line: 31, column: 23, scope: !31)
!35 = !DILocation(line: 33, column: 9, scope: !31)
!36 = !DILocation(line: 34, column: 9, scope: !31)
!37 = !DILocation(line: 34, column: 21, scope: !31)
!38 = !DILocation(line: 35, column: 21, scope: !31)
!39 = !DILocation(line: 35, column: 10, scope: !31)
!40 = !DILocation(line: 35, column: 19, scope: !31)
!41 = !DILocalVariable(name: "data", scope: !42, file: !14, line: 38, type: !3)
!42 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!43 = !DILocation(line: 38, column: 16, scope: !42)
!44 = !DILocation(line: 38, column: 24, scope: !42)
!45 = !DILocation(line: 38, column: 23, scope: !42)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !14, line: 40, type: !48)
!47 = distinct !DILexicalBlock(scope: !42, file: !14, line: 39, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 50)
!51 = !DILocation(line: 40, column: 18, scope: !47)
!52 = !DILocalVariable(name: "i", scope: !47, file: !14, line: 41, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 31, baseType: !55)
!54 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !56, line: 94, baseType: !57)
!56 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!57 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 41, column: 20, scope: !47)
!59 = !DILocalVariable(name: "dataLen", scope: !47, file: !14, line: 41, type: !53)
!60 = !DILocation(line: 41, column: 23, scope: !47)
!61 = !DILocation(line: 42, column: 30, scope: !47)
!62 = !DILocation(line: 42, column: 23, scope: !47)
!63 = !DILocation(line: 42, column: 21, scope: !47)
!64 = !DILocation(line: 44, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !47, file: !14, line: 44, column: 13)
!66 = !DILocation(line: 44, column: 18, scope: !65)
!67 = !DILocation(line: 44, column: 25, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !14, line: 44, column: 13)
!69 = !DILocation(line: 44, column: 29, scope: !68)
!70 = !DILocation(line: 44, column: 27, scope: !68)
!71 = !DILocation(line: 44, column: 13, scope: !65)
!72 = !DILocation(line: 46, column: 27, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !14, line: 45, column: 13)
!74 = !DILocation(line: 46, column: 32, scope: !73)
!75 = !DILocation(line: 46, column: 22, scope: !73)
!76 = !DILocation(line: 46, column: 17, scope: !73)
!77 = !DILocation(line: 46, column: 25, scope: !73)
!78 = !DILocation(line: 47, column: 13, scope: !73)
!79 = !DILocation(line: 44, column: 39, scope: !68)
!80 = !DILocation(line: 44, column: 13, scope: !68)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 47, column: 13, scope: !65)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 48, column: 13, scope: !47)
!85 = !DILocation(line: 48, column: 24, scope: !47)
!86 = !DILocation(line: 49, column: 23, scope: !47)
!87 = !DILocation(line: 49, column: 13, scope: !47)
!88 = !DILocation(line: 52, column: 1, scope: !13)
!89 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32_good", scope: !14, file: !14, line: 90, type: !15, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!90 = !DILocation(line: 92, column: 5, scope: !89)
!91 = !DILocation(line: 93, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 104, type: !93, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!93 = !DISubroutineType(types: !94)
!94 = !{!95, !95, !21}
!95 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !14, line: 104, type: !95)
!97 = !DILocation(line: 104, column: 14, scope: !92)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !14, line: 104, type: !21)
!99 = !DILocation(line: 104, column: 27, scope: !92)
!100 = !DILocation(line: 107, column: 22, scope: !92)
!101 = !DILocation(line: 107, column: 12, scope: !92)
!102 = !DILocation(line: 107, column: 5, scope: !92)
!103 = !DILocation(line: 109, column: 5, scope: !92)
!104 = !DILocation(line: 110, column: 5, scope: !92)
!105 = !DILocation(line: 111, column: 5, scope: !92)
!106 = !DILocation(line: 114, column: 5, scope: !92)
!107 = !DILocation(line: 115, column: 5, scope: !92)
!108 = !DILocation(line: 116, column: 5, scope: !92)
!109 = !DILocation(line: 118, column: 5, scope: !92)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!111 = !DILocalVariable(name: "data", scope: !110, file: !14, line: 61, type: !3)
!112 = !DILocation(line: 61, column: 12, scope: !110)
!113 = !DILocalVariable(name: "dataPtr1", scope: !110, file: !14, line: 62, type: !21)
!114 = !DILocation(line: 62, column: 13, scope: !110)
!115 = !DILocalVariable(name: "dataPtr2", scope: !110, file: !14, line: 63, type: !21)
!116 = !DILocation(line: 63, column: 13, scope: !110)
!117 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !14, line: 64, type: !3)
!118 = !DILocation(line: 64, column: 12, scope: !110)
!119 = !DILocation(line: 64, column: 33, scope: !110)
!120 = !DILocation(line: 65, column: 12, scope: !110)
!121 = !DILocation(line: 65, column: 10, scope: !110)
!122 = !DILocalVariable(name: "data", scope: !123, file: !14, line: 67, type: !3)
!123 = distinct !DILexicalBlock(scope: !110, file: !14, line: 66, column: 5)
!124 = !DILocation(line: 67, column: 16, scope: !123)
!125 = !DILocation(line: 67, column: 24, scope: !123)
!126 = !DILocation(line: 67, column: 23, scope: !123)
!127 = !DILocation(line: 69, column: 9, scope: !123)
!128 = !DILocation(line: 70, column: 9, scope: !123)
!129 = !DILocation(line: 70, column: 20, scope: !123)
!130 = !DILocation(line: 71, column: 21, scope: !123)
!131 = !DILocation(line: 71, column: 10, scope: !123)
!132 = !DILocation(line: 71, column: 19, scope: !123)
!133 = !DILocalVariable(name: "data", scope: !134, file: !14, line: 74, type: !3)
!134 = distinct !DILexicalBlock(scope: !110, file: !14, line: 73, column: 5)
!135 = !DILocation(line: 74, column: 16, scope: !134)
!136 = !DILocation(line: 74, column: 24, scope: !134)
!137 = !DILocation(line: 74, column: 23, scope: !134)
!138 = !DILocalVariable(name: "dest", scope: !139, file: !14, line: 76, type: !48)
!139 = distinct !DILexicalBlock(scope: !134, file: !14, line: 75, column: 9)
!140 = !DILocation(line: 76, column: 18, scope: !139)
!141 = !DILocalVariable(name: "i", scope: !139, file: !14, line: 77, type: !53)
!142 = !DILocation(line: 77, column: 20, scope: !139)
!143 = !DILocalVariable(name: "dataLen", scope: !139, file: !14, line: 77, type: !53)
!144 = !DILocation(line: 77, column: 23, scope: !139)
!145 = !DILocation(line: 78, column: 30, scope: !139)
!146 = !DILocation(line: 78, column: 23, scope: !139)
!147 = !DILocation(line: 78, column: 21, scope: !139)
!148 = !DILocation(line: 80, column: 20, scope: !149)
!149 = distinct !DILexicalBlock(scope: !139, file: !14, line: 80, column: 13)
!150 = !DILocation(line: 80, column: 18, scope: !149)
!151 = !DILocation(line: 80, column: 25, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !14, line: 80, column: 13)
!153 = !DILocation(line: 80, column: 29, scope: !152)
!154 = !DILocation(line: 80, column: 27, scope: !152)
!155 = !DILocation(line: 80, column: 13, scope: !149)
!156 = !DILocation(line: 82, column: 27, scope: !157)
!157 = distinct !DILexicalBlock(scope: !152, file: !14, line: 81, column: 13)
!158 = !DILocation(line: 82, column: 32, scope: !157)
!159 = !DILocation(line: 82, column: 22, scope: !157)
!160 = !DILocation(line: 82, column: 17, scope: !157)
!161 = !DILocation(line: 82, column: 25, scope: !157)
!162 = !DILocation(line: 83, column: 13, scope: !157)
!163 = !DILocation(line: 80, column: 39, scope: !152)
!164 = !DILocation(line: 80, column: 13, scope: !152)
!165 = distinct !{!165, !155, !166, !83}
!166 = !DILocation(line: 83, column: 13, scope: !149)
!167 = !DILocation(line: 84, column: 13, scope: !139)
!168 = !DILocation(line: 84, column: 24, scope: !139)
!169 = !DILocation(line: 85, column: 23, scope: !139)
!170 = !DILocation(line: 85, column: 13, scope: !139)
!171 = !DILocation(line: 88, column: 1, scope: !110)
