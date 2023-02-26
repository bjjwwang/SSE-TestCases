; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %0, i8** %dataBuffer, align 8, !dbg !28
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  store i8* %1, i8** %data, align 8, !dbg !31
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !32
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #5, !dbg !32
  %5 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %6 = load i8*, i8** %data, align 8, !dbg !35
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !36
  store i8* %6, i8** %unionFirst, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !38, metadata !DIExpression()), !dbg !40
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !41
  %7 = load i8*, i8** %unionSecond, align 8, !dbg !41
  store i8* %7, i8** %data1, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !55, metadata !DIExpression()), !dbg !56
  %9 = load i8*, i8** %data1, align 8, !dbg !57
  %call2 = call i64 @strlen(i8* noundef %9), !dbg !58
  store i64 %call2, i64* %dataLen, align 8, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %entry
  %10 = load i64, i64* %i, align 8, !dbg !63
  %11 = load i64, i64* %dataLen, align 8, !dbg !65
  %cmp = icmp ult i64 %10, %11, !dbg !66
  br i1 %cmp, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %12 = load i8*, i8** %data1, align 8, !dbg !68
  %13 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx3 = getelementptr inbounds i8, i8* %12, i64 %13, !dbg !68
  %14 = load i8, i8* %arrayidx3, align 1, !dbg !68
  %15 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %15, !dbg !72
  store i8 %14, i8* %arrayidx4, align 1, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %16, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !80
  store i8 0, i8* %arrayidx5, align 1, !dbg !81
  %17 = load i8*, i8** %data1, align 8, !dbg !82
  call void @printLine(i8* noundef %17), !dbg !83
  ret void, !dbg !84
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* noundef null), !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 noundef %conv), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_good(), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_bad(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType* %myUnion, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 100, align 16, !dbg !114
  store i8* %0, i8** %dataBuffer, align 8, !dbg !113
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !115
  store i8* %1, i8** %data, align 8, !dbg !116
  %2 = load i8*, i8** %data, align 8, !dbg !117
  %3 = load i8*, i8** %data, align 8, !dbg !117
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !117
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !117
  %5 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %6 = load i8*, i8** %data, align 8, !dbg !120
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !121
  store i8* %6, i8** %unionFirst, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !123, metadata !DIExpression()), !dbg !125
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !126
  %7 = load i8*, i8** %unionSecond, align 8, !dbg !126
  store i8* %7, i8** %data1, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !132, metadata !DIExpression()), !dbg !133
  %9 = load i8*, i8** %data1, align 8, !dbg !134
  %call2 = call i64 @strlen(i8* noundef %9), !dbg !135
  store i64 %call2, i64* %dataLen, align 8, !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %entry
  %10 = load i64, i64* %i, align 8, !dbg !140
  %11 = load i64, i64* %dataLen, align 8, !dbg !142
  %cmp = icmp ult i64 %10, %11, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %12 = load i8*, i8** %data1, align 8, !dbg !145
  %13 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx3 = getelementptr inbounds i8, i8* %12, i64 %13, !dbg !145
  %14 = load i8, i8* %arrayidx3, align 1, !dbg !145
  %15 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %15, !dbg !149
  store i8 %14, i8* %arrayidx4, align 1, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %16, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !156
  store i8 0, i8* %arrayidx5, align 1, !dbg !157
  %17 = load i8*, i8** %data1, align 8, !dbg !158
  call void @printLine(i8* noundef %17), !dbg !159
  ret void, !dbg !160
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !3)
!19 = !DILocation(line: 31, column: 12, scope: !13)
!20 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType", file: !14, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !14, line: 23, baseType: !3, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !14, line: 24, baseType: !3, size: 64)
!26 = !DILocation(line: 32, column: 78, scope: !13)
!27 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 33, type: !3)
!28 = !DILocation(line: 33, column: 12, scope: !13)
!29 = !DILocation(line: 33, column: 33, scope: !13)
!30 = !DILocation(line: 34, column: 12, scope: !13)
!31 = !DILocation(line: 34, column: 10, scope: !13)
!32 = !DILocation(line: 36, column: 5, scope: !13)
!33 = !DILocation(line: 37, column: 5, scope: !13)
!34 = !DILocation(line: 37, column: 17, scope: !13)
!35 = !DILocation(line: 38, column: 26, scope: !13)
!36 = !DILocation(line: 38, column: 13, scope: !13)
!37 = !DILocation(line: 38, column: 24, scope: !13)
!38 = !DILocalVariable(name: "data", scope: !39, file: !14, line: 40, type: !3)
!39 = distinct !DILexicalBlock(scope: !13, file: !14, line: 39, column: 5)
!40 = !DILocation(line: 40, column: 16, scope: !39)
!41 = !DILocation(line: 40, column: 31, scope: !39)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !14, line: 42, type: !44)
!43 = distinct !DILexicalBlock(scope: !39, file: !14, line: 41, column: 9)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 42, column: 18, scope: !43)
!48 = !DILocalVariable(name: "i", scope: !43, file: !14, line: 43, type: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 31, baseType: !51)
!50 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !52, line: 94, baseType: !53)
!52 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!53 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 43, column: 20, scope: !43)
!55 = !DILocalVariable(name: "dataLen", scope: !43, file: !14, line: 43, type: !49)
!56 = !DILocation(line: 43, column: 23, scope: !43)
!57 = !DILocation(line: 44, column: 30, scope: !43)
!58 = !DILocation(line: 44, column: 23, scope: !43)
!59 = !DILocation(line: 44, column: 21, scope: !43)
!60 = !DILocation(line: 46, column: 20, scope: !61)
!61 = distinct !DILexicalBlock(scope: !43, file: !14, line: 46, column: 13)
!62 = !DILocation(line: 46, column: 18, scope: !61)
!63 = !DILocation(line: 46, column: 25, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !14, line: 46, column: 13)
!65 = !DILocation(line: 46, column: 29, scope: !64)
!66 = !DILocation(line: 46, column: 27, scope: !64)
!67 = !DILocation(line: 46, column: 13, scope: !61)
!68 = !DILocation(line: 48, column: 27, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !14, line: 47, column: 13)
!70 = !DILocation(line: 48, column: 32, scope: !69)
!71 = !DILocation(line: 48, column: 22, scope: !69)
!72 = !DILocation(line: 48, column: 17, scope: !69)
!73 = !DILocation(line: 48, column: 25, scope: !69)
!74 = !DILocation(line: 49, column: 13, scope: !69)
!75 = !DILocation(line: 46, column: 39, scope: !64)
!76 = !DILocation(line: 46, column: 13, scope: !64)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 49, column: 13, scope: !61)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 50, column: 13, scope: !43)
!81 = !DILocation(line: 50, column: 24, scope: !43)
!82 = !DILocation(line: 51, column: 23, scope: !43)
!83 = !DILocation(line: 51, column: 13, scope: !43)
!84 = !DILocation(line: 54, column: 1, scope: !13)
!85 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_good", scope: !14, file: !14, line: 88, type: !15, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!86 = !DILocation(line: 90, column: 5, scope: !85)
!87 = !DILocation(line: 91, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 102, type: !89, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!89 = !DISubroutineType(types: !90)
!90 = !{!91, !91, !92}
!91 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !14, line: 102, type: !91)
!94 = !DILocation(line: 102, column: 14, scope: !88)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !14, line: 102, type: !92)
!96 = !DILocation(line: 102, column: 27, scope: !88)
!97 = !DILocation(line: 105, column: 22, scope: !88)
!98 = !DILocation(line: 105, column: 12, scope: !88)
!99 = !DILocation(line: 105, column: 5, scope: !88)
!100 = !DILocation(line: 107, column: 5, scope: !88)
!101 = !DILocation(line: 108, column: 5, scope: !88)
!102 = !DILocation(line: 109, column: 5, scope: !88)
!103 = !DILocation(line: 112, column: 5, scope: !88)
!104 = !DILocation(line: 113, column: 5, scope: !88)
!105 = !DILocation(line: 114, column: 5, scope: !88)
!106 = !DILocation(line: 116, column: 5, scope: !88)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 61, type: !15, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!108 = !DILocalVariable(name: "data", scope: !107, file: !14, line: 63, type: !3)
!109 = !DILocation(line: 63, column: 12, scope: !107)
!110 = !DILocalVariable(name: "myUnion", scope: !107, file: !14, line: 64, type: !21)
!111 = !DILocation(line: 64, column: 78, scope: !107)
!112 = !DILocalVariable(name: "dataBuffer", scope: !107, file: !14, line: 65, type: !3)
!113 = !DILocation(line: 65, column: 12, scope: !107)
!114 = !DILocation(line: 65, column: 33, scope: !107)
!115 = !DILocation(line: 66, column: 12, scope: !107)
!116 = !DILocation(line: 66, column: 10, scope: !107)
!117 = !DILocation(line: 68, column: 5, scope: !107)
!118 = !DILocation(line: 69, column: 5, scope: !107)
!119 = !DILocation(line: 69, column: 16, scope: !107)
!120 = !DILocation(line: 70, column: 26, scope: !107)
!121 = !DILocation(line: 70, column: 13, scope: !107)
!122 = !DILocation(line: 70, column: 24, scope: !107)
!123 = !DILocalVariable(name: "data", scope: !124, file: !14, line: 72, type: !3)
!124 = distinct !DILexicalBlock(scope: !107, file: !14, line: 71, column: 5)
!125 = !DILocation(line: 72, column: 16, scope: !124)
!126 = !DILocation(line: 72, column: 31, scope: !124)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !14, line: 74, type: !44)
!128 = distinct !DILexicalBlock(scope: !124, file: !14, line: 73, column: 9)
!129 = !DILocation(line: 74, column: 18, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !128, file: !14, line: 75, type: !49)
!131 = !DILocation(line: 75, column: 20, scope: !128)
!132 = !DILocalVariable(name: "dataLen", scope: !128, file: !14, line: 75, type: !49)
!133 = !DILocation(line: 75, column: 23, scope: !128)
!134 = !DILocation(line: 76, column: 30, scope: !128)
!135 = !DILocation(line: 76, column: 23, scope: !128)
!136 = !DILocation(line: 76, column: 21, scope: !128)
!137 = !DILocation(line: 78, column: 20, scope: !138)
!138 = distinct !DILexicalBlock(scope: !128, file: !14, line: 78, column: 13)
!139 = !DILocation(line: 78, column: 18, scope: !138)
!140 = !DILocation(line: 78, column: 25, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !14, line: 78, column: 13)
!142 = !DILocation(line: 78, column: 29, scope: !141)
!143 = !DILocation(line: 78, column: 27, scope: !141)
!144 = !DILocation(line: 78, column: 13, scope: !138)
!145 = !DILocation(line: 80, column: 27, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !14, line: 79, column: 13)
!147 = !DILocation(line: 80, column: 32, scope: !146)
!148 = !DILocation(line: 80, column: 22, scope: !146)
!149 = !DILocation(line: 80, column: 17, scope: !146)
!150 = !DILocation(line: 80, column: 25, scope: !146)
!151 = !DILocation(line: 81, column: 13, scope: !146)
!152 = !DILocation(line: 78, column: 39, scope: !141)
!153 = !DILocation(line: 78, column: 13, scope: !141)
!154 = distinct !{!154, !144, !155, !79}
!155 = !DILocation(line: 81, column: 13, scope: !138)
!156 = !DILocation(line: 82, column: 13, scope: !128)
!157 = !DILocation(line: 82, column: 24, scope: !128)
!158 = !DILocation(line: 83, column: 23, scope: !128)
!159 = !DILocation(line: 83, column: 13, scope: !128)
!160 = !DILocation(line: 86, column: 1, scope: !107)
