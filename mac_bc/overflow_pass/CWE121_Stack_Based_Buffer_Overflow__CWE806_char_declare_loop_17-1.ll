; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i1 = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !28
  store i8* %arraydecay, i8** %data, align 8, !dbg !29
  store i32 0, i32* %i, align 4, !dbg !30
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !33
  %cmp = icmp slt i32 %0, 1, !dbg !35
  br i1 %cmp, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data, align 8, !dbg !37
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !37
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #5, !dbg !37
  %4 = load i8*, i8** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !42
  %inc = add nsw i32 %5, 1, !dbg !42
  store i32 %inc, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !47, metadata !DIExpression()), !dbg !52
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !53, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !60, metadata !DIExpression()), !dbg !61
  %7 = load i8*, i8** %data, align 8, !dbg !62
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !63
  store i64 %call2, i64* %dataLen, align 8, !dbg !64
  store i64 0, i64* %i1, align 8, !dbg !65
  br label %for.cond3, !dbg !67

for.cond3:                                        ; preds = %for.inc8, %for.end
  %8 = load i64, i64* %i1, align 8, !dbg !68
  %9 = load i64, i64* %dataLen, align 8, !dbg !70
  %cmp4 = icmp ult i64 %8, %9, !dbg !71
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !72

for.body5:                                        ; preds = %for.cond3
  %10 = load i8*, i8** %data, align 8, !dbg !73
  %11 = load i64, i64* %i1, align 8, !dbg !75
  %arrayidx6 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !73
  %12 = load i8, i8* %arrayidx6, align 1, !dbg !73
  %13 = load i64, i64* %i1, align 8, !dbg !76
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !77
  store i8 %12, i8* %arrayidx7, align 1, !dbg !78
  br label %for.inc8, !dbg !79

for.inc8:                                         ; preds = %for.body5
  %14 = load i64, i64* %i1, align 8, !dbg !80
  %inc9 = add i64 %14, 1, !dbg !80
  store i64 %inc9, i64* %i1, align 8, !dbg !80
  br label %for.cond3, !dbg !81, !llvm.loop !82

for.end10:                                        ; preds = %for.cond3
  %arrayidx11 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !84
  store i8 0, i8* %arrayidx11, align 1, !dbg !85
  %15 = load i8*, i8** %data, align 8, !dbg !86
  call void @printLine(i8* noundef %15), !dbg !87
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17_good() #0 !dbg !89 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17_good(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17_bad(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !117
  store i8* %arraydecay, i8** %data, align 8, !dbg !118
  store i32 0, i32* %h, align 4, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !122
  %cmp = icmp slt i32 %0, 1, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data, align 8, !dbg !126
  %2 = load i8*, i8** %data, align 8, !dbg !126
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !126
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !126
  %4 = load i8*, i8** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !131
  %inc = add nsw i32 %5, 1, !dbg !131
  store i32 %inc, i32* %h, align 4, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !135, metadata !DIExpression()), !dbg !137
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %i, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !140, metadata !DIExpression()), !dbg !141
  %7 = load i8*, i8** %data, align 8, !dbg !142
  %call1 = call i64 @strlen(i8* noundef %7), !dbg !143
  store i64 %call1, i64* %dataLen, align 8, !dbg !144
  store i64 0, i64* %i, align 8, !dbg !145
  br label %for.cond2, !dbg !147

for.cond2:                                        ; preds = %for.inc7, %for.end
  %8 = load i64, i64* %i, align 8, !dbg !148
  %9 = load i64, i64* %dataLen, align 8, !dbg !150
  %cmp3 = icmp ult i64 %8, %9, !dbg !151
  br i1 %cmp3, label %for.body4, label %for.end9, !dbg !152

for.body4:                                        ; preds = %for.cond2
  %10 = load i8*, i8** %data, align 8, !dbg !153
  %11 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !153
  %12 = load i8, i8* %arrayidx5, align 1, !dbg !153
  %13 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !157
  store i8 %12, i8* %arrayidx6, align 1, !dbg !158
  br label %for.inc7, !dbg !159

for.inc7:                                         ; preds = %for.body4
  %14 = load i64, i64* %i, align 8, !dbg !160
  %inc8 = add i64 %14, 1, !dbg !160
  store i64 %inc8, i64* %i, align 8, !dbg !160
  br label %for.cond2, !dbg !161, !llvm.loop !162

for.end9:                                         ; preds = %for.cond2
  %arrayidx10 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !164
  store i8 0, i8* %arrayidx10, align 1, !dbg !165
  %15 = load i8*, i8** %data, align 8, !dbg !166
  call void @printLine(i8* noundef %15), !dbg !167
  ret void, !dbg !168
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 25, column: 9, scope: !11)
!19 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 26, column: 12, scope: !11)
!23 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 27, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 800, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 27, column: 10, scope: !11)
!28 = !DILocation(line: 28, column: 12, scope: !11)
!29 = !DILocation(line: 28, column: 10, scope: !11)
!30 = !DILocation(line: 29, column: 11, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!32 = !DILocation(line: 29, column: 9, scope: !31)
!33 = !DILocation(line: 29, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 29, column: 5)
!35 = !DILocation(line: 29, column: 18, scope: !34)
!36 = !DILocation(line: 29, column: 5, scope: !31)
!37 = !DILocation(line: 32, column: 9, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !12, line: 30, column: 5)
!39 = !DILocation(line: 33, column: 9, scope: !38)
!40 = !DILocation(line: 33, column: 21, scope: !38)
!41 = !DILocation(line: 34, column: 5, scope: !38)
!42 = !DILocation(line: 29, column: 24, scope: !34)
!43 = !DILocation(line: 29, column: 5, scope: !34)
!44 = distinct !{!44, !36, !45, !46}
!45 = !DILocation(line: 34, column: 5, scope: !31)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocalVariable(name: "dest", scope: !48, file: !12, line: 36, type: !49)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 400, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 50)
!52 = !DILocation(line: 36, column: 14, scope: !48)
!53 = !DILocalVariable(name: "i", scope: !48, file: !12, line: 37, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 31, baseType: !56)
!55 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !57, line: 94, baseType: !58)
!57 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!58 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 37, column: 16, scope: !48)
!60 = !DILocalVariable(name: "dataLen", scope: !48, file: !12, line: 37, type: !54)
!61 = !DILocation(line: 37, column: 19, scope: !48)
!62 = !DILocation(line: 38, column: 26, scope: !48)
!63 = !DILocation(line: 38, column: 19, scope: !48)
!64 = !DILocation(line: 38, column: 17, scope: !48)
!65 = !DILocation(line: 40, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !48, file: !12, line: 40, column: 9)
!67 = !DILocation(line: 40, column: 14, scope: !66)
!68 = !DILocation(line: 40, column: 21, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !12, line: 40, column: 9)
!70 = !DILocation(line: 40, column: 25, scope: !69)
!71 = !DILocation(line: 40, column: 23, scope: !69)
!72 = !DILocation(line: 40, column: 9, scope: !66)
!73 = !DILocation(line: 42, column: 23, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !12, line: 41, column: 9)
!75 = !DILocation(line: 42, column: 28, scope: !74)
!76 = !DILocation(line: 42, column: 18, scope: !74)
!77 = !DILocation(line: 42, column: 13, scope: !74)
!78 = !DILocation(line: 42, column: 21, scope: !74)
!79 = !DILocation(line: 43, column: 9, scope: !74)
!80 = !DILocation(line: 40, column: 35, scope: !69)
!81 = !DILocation(line: 40, column: 9, scope: !69)
!82 = distinct !{!82, !72, !83, !46}
!83 = !DILocation(line: 43, column: 9, scope: !66)
!84 = !DILocation(line: 44, column: 9, scope: !48)
!85 = !DILocation(line: 44, column: 20, scope: !48)
!86 = !DILocation(line: 45, column: 19, scope: !48)
!87 = !DILocation(line: 45, column: 9, scope: !48)
!88 = !DILocation(line: 47, column: 1, scope: !11)
!89 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17_good", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!90 = !DILocation(line: 82, column: 5, scope: !89)
!91 = !DILocation(line: 83, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 95, type: !93, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!93 = !DISubroutineType(types: !94)
!94 = !{!17, !17, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !12, line: 95, type: !17)
!97 = !DILocation(line: 95, column: 14, scope: !92)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !12, line: 95, type: !95)
!99 = !DILocation(line: 95, column: 27, scope: !92)
!100 = !DILocation(line: 98, column: 22, scope: !92)
!101 = !DILocation(line: 98, column: 12, scope: !92)
!102 = !DILocation(line: 98, column: 5, scope: !92)
!103 = !DILocation(line: 100, column: 5, scope: !92)
!104 = !DILocation(line: 101, column: 5, scope: !92)
!105 = !DILocation(line: 102, column: 5, scope: !92)
!106 = !DILocation(line: 105, column: 5, scope: !92)
!107 = !DILocation(line: 106, column: 5, scope: !92)
!108 = !DILocation(line: 107, column: 5, scope: !92)
!109 = !DILocation(line: 109, column: 5, scope: !92)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!111 = !DILocalVariable(name: "h", scope: !110, file: !12, line: 56, type: !17)
!112 = !DILocation(line: 56, column: 9, scope: !110)
!113 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 57, type: !20)
!114 = !DILocation(line: 57, column: 12, scope: !110)
!115 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !12, line: 58, type: !24)
!116 = !DILocation(line: 58, column: 10, scope: !110)
!117 = !DILocation(line: 59, column: 12, scope: !110)
!118 = !DILocation(line: 59, column: 10, scope: !110)
!119 = !DILocation(line: 60, column: 11, scope: !120)
!120 = distinct !DILexicalBlock(scope: !110, file: !12, line: 60, column: 5)
!121 = !DILocation(line: 60, column: 9, scope: !120)
!122 = !DILocation(line: 60, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 60, column: 5)
!124 = !DILocation(line: 60, column: 18, scope: !123)
!125 = !DILocation(line: 60, column: 5, scope: !120)
!126 = !DILocation(line: 63, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !12, line: 61, column: 5)
!128 = !DILocation(line: 64, column: 9, scope: !127)
!129 = !DILocation(line: 64, column: 20, scope: !127)
!130 = !DILocation(line: 65, column: 5, scope: !127)
!131 = !DILocation(line: 60, column: 24, scope: !123)
!132 = !DILocation(line: 60, column: 5, scope: !123)
!133 = distinct !{!133, !125, !134, !46}
!134 = !DILocation(line: 65, column: 5, scope: !120)
!135 = !DILocalVariable(name: "dest", scope: !136, file: !12, line: 67, type: !49)
!136 = distinct !DILexicalBlock(scope: !110, file: !12, line: 66, column: 5)
!137 = !DILocation(line: 67, column: 14, scope: !136)
!138 = !DILocalVariable(name: "i", scope: !136, file: !12, line: 68, type: !54)
!139 = !DILocation(line: 68, column: 16, scope: !136)
!140 = !DILocalVariable(name: "dataLen", scope: !136, file: !12, line: 68, type: !54)
!141 = !DILocation(line: 68, column: 19, scope: !136)
!142 = !DILocation(line: 69, column: 26, scope: !136)
!143 = !DILocation(line: 69, column: 19, scope: !136)
!144 = !DILocation(line: 69, column: 17, scope: !136)
!145 = !DILocation(line: 71, column: 16, scope: !146)
!146 = distinct !DILexicalBlock(scope: !136, file: !12, line: 71, column: 9)
!147 = !DILocation(line: 71, column: 14, scope: !146)
!148 = !DILocation(line: 71, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !12, line: 71, column: 9)
!150 = !DILocation(line: 71, column: 25, scope: !149)
!151 = !DILocation(line: 71, column: 23, scope: !149)
!152 = !DILocation(line: 71, column: 9, scope: !146)
!153 = !DILocation(line: 73, column: 23, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !12, line: 72, column: 9)
!155 = !DILocation(line: 73, column: 28, scope: !154)
!156 = !DILocation(line: 73, column: 18, scope: !154)
!157 = !DILocation(line: 73, column: 13, scope: !154)
!158 = !DILocation(line: 73, column: 21, scope: !154)
!159 = !DILocation(line: 74, column: 9, scope: !154)
!160 = !DILocation(line: 71, column: 35, scope: !149)
!161 = !DILocation(line: 71, column: 9, scope: !149)
!162 = distinct !{!162, !152, !163, !46}
!163 = !DILocation(line: 74, column: 9, scope: !146)
!164 = !DILocation(line: 75, column: 9, scope: !136)
!165 = !DILocation(line: 75, column: 20, scope: !136)
!166 = !DILocation(line: 76, column: 19, scope: !136)
!167 = !DILocation(line: 76, column: 9, scope: !136)
!168 = !DILocation(line: 78, column: 1, scope: !110)
