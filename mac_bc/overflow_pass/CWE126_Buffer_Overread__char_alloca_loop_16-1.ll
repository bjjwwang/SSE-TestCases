; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_loop_16_bad() #0 !dbg !13 {
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
  br label %while.body, !dbg !32

while.body:                                       ; preds = %entry
  %10 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  store i8* %10, i8** %data, align 8, !dbg !35
  br label %while.end, !dbg !36

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !47, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !52
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx3, align 1, !dbg !54
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !56
  store i64 %call5, i64* %destLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %while.end
  %11 = load i64, i64* %i, align 8, !dbg !61
  %12 = load i64, i64* %destLen, align 8, !dbg !63
  %cmp = icmp ult i64 %11, %12, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %13 = load i8*, i8** %data, align 8, !dbg !66
  %14 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx6 = getelementptr inbounds i8, i8* %13, i64 %14, !dbg !66
  %15 = load i8, i8* %arrayidx6, align 1, !dbg !66
  %16 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %16, !dbg !70
  store i8 %15, i8* %arrayidx7, align 1, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %17, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !78
  store i8 0, i8* %arrayidx8, align 1, !dbg !79
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !80
  call void @printLine(i8* noundef %arraydecay9), !dbg !81
  ret void, !dbg !82
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
define void @CWE126_Buffer_Overread__char_alloca_loop_16_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
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
  call void @CWE126_Buffer_Overread__char_alloca_loop_16_good(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE126_Buffer_Overread__char_alloca_loop_16_bad(), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !105 {
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
  br label %while.body, !dbg !120

while.body:                                       ; preds = %entry
  %10 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !121
  store i8* %10, i8** %data, align 8, !dbg !123
  br label %while.end, !dbg !124

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !130, metadata !DIExpression()), !dbg !131
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !132
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !133
  store i8 0, i8* %arrayidx3, align 1, !dbg !134
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !135
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !136
  store i64 %call5, i64* %destLen, align 8, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %while.end
  %11 = load i64, i64* %i, align 8, !dbg !141
  %12 = load i64, i64* %destLen, align 8, !dbg !143
  %cmp = icmp ult i64 %11, %12, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %13 = load i8*, i8** %data, align 8, !dbg !146
  %14 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx6 = getelementptr inbounds i8, i8* %13, i64 %14, !dbg !146
  %15 = load i8, i8* %arrayidx6, align 1, !dbg !146
  %16 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %16, !dbg !150
  store i8 %15, i8* %arrayidx7, align 1, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %17, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !157
  store i8 0, i8* %arrayidx8, align 1, !dbg !158
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !159
  call void @printLine(i8* noundef %arraydecay9), !dbg !160
  ret void, !dbg !161
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_16_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!32 = !DILocation(line: 32, column: 5, scope: !13)
!33 = !DILocation(line: 35, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 5)
!35 = !DILocation(line: 35, column: 14, scope: !34)
!36 = !DILocation(line: 36, column: 9, scope: !34)
!37 = !DILocalVariable(name: "i", scope: !38, file: !14, line: 39, type: !39)
!38 = distinct !DILexicalBlock(scope: !13, file: !14, line: 38, column: 5)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 31, baseType: !41)
!40 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !42, line: 94, baseType: !43)
!42 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!43 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 39, column: 16, scope: !38)
!45 = !DILocalVariable(name: "destLen", scope: !38, file: !14, line: 39, type: !39)
!46 = !DILocation(line: 39, column: 19, scope: !38)
!47 = !DILocalVariable(name: "dest", scope: !38, file: !14, line: 40, type: !48)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 40, column: 14, scope: !38)
!52 = !DILocation(line: 41, column: 9, scope: !38)
!53 = !DILocation(line: 42, column: 9, scope: !38)
!54 = !DILocation(line: 42, column: 21, scope: !38)
!55 = !DILocation(line: 43, column: 26, scope: !38)
!56 = !DILocation(line: 43, column: 19, scope: !38)
!57 = !DILocation(line: 43, column: 17, scope: !38)
!58 = !DILocation(line: 46, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !38, file: !14, line: 46, column: 9)
!60 = !DILocation(line: 46, column: 14, scope: !59)
!61 = !DILocation(line: 46, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !14, line: 46, column: 9)
!63 = !DILocation(line: 46, column: 25, scope: !62)
!64 = !DILocation(line: 46, column: 23, scope: !62)
!65 = !DILocation(line: 46, column: 9, scope: !59)
!66 = !DILocation(line: 48, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !14, line: 47, column: 9)
!68 = !DILocation(line: 48, column: 28, scope: !67)
!69 = !DILocation(line: 48, column: 18, scope: !67)
!70 = !DILocation(line: 48, column: 13, scope: !67)
!71 = !DILocation(line: 48, column: 21, scope: !67)
!72 = !DILocation(line: 49, column: 9, scope: !67)
!73 = !DILocation(line: 46, column: 35, scope: !62)
!74 = !DILocation(line: 46, column: 9, scope: !62)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 49, column: 9, scope: !59)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 50, column: 9, scope: !38)
!79 = !DILocation(line: 50, column: 21, scope: !38)
!80 = !DILocation(line: 51, column: 19, scope: !38)
!81 = !DILocation(line: 51, column: 9, scope: !38)
!82 = !DILocation(line: 53, column: 1, scope: !13)
!83 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_16_good", scope: !14, file: !14, line: 92, type: !15, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!84 = !DILocation(line: 94, column: 5, scope: !83)
!85 = !DILocation(line: 95, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 107, type: !87, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!87 = !DISubroutineType(types: !88)
!88 = !{!89, !89, !90}
!89 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !14, line: 107, type: !89)
!92 = !DILocation(line: 107, column: 14, scope: !86)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !14, line: 107, type: !90)
!94 = !DILocation(line: 107, column: 27, scope: !86)
!95 = !DILocation(line: 110, column: 22, scope: !86)
!96 = !DILocation(line: 110, column: 12, scope: !86)
!97 = !DILocation(line: 110, column: 5, scope: !86)
!98 = !DILocation(line: 112, column: 5, scope: !86)
!99 = !DILocation(line: 113, column: 5, scope: !86)
!100 = !DILocation(line: 114, column: 5, scope: !86)
!101 = !DILocation(line: 117, column: 5, scope: !86)
!102 = !DILocation(line: 118, column: 5, scope: !86)
!103 = !DILocation(line: 119, column: 5, scope: !86)
!104 = !DILocation(line: 121, column: 5, scope: !86)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!106 = !DILocalVariable(name: "data", scope: !105, file: !14, line: 62, type: !3)
!107 = !DILocation(line: 62, column: 12, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !14, line: 63, type: !3)
!109 = !DILocation(line: 63, column: 12, scope: !105)
!110 = !DILocation(line: 63, column: 36, scope: !105)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !14, line: 64, type: !3)
!112 = !DILocation(line: 64, column: 12, scope: !105)
!113 = !DILocation(line: 64, column: 37, scope: !105)
!114 = !DILocation(line: 65, column: 5, scope: !105)
!115 = !DILocation(line: 66, column: 5, scope: !105)
!116 = !DILocation(line: 66, column: 25, scope: !105)
!117 = !DILocation(line: 67, column: 5, scope: !105)
!118 = !DILocation(line: 68, column: 5, scope: !105)
!119 = !DILocation(line: 68, column: 27, scope: !105)
!120 = !DILocation(line: 69, column: 5, scope: !105)
!121 = !DILocation(line: 72, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !105, file: !14, line: 70, column: 5)
!123 = !DILocation(line: 72, column: 14, scope: !122)
!124 = !DILocation(line: 73, column: 9, scope: !122)
!125 = !DILocalVariable(name: "i", scope: !126, file: !14, line: 76, type: !39)
!126 = distinct !DILexicalBlock(scope: !105, file: !14, line: 75, column: 5)
!127 = !DILocation(line: 76, column: 16, scope: !126)
!128 = !DILocalVariable(name: "destLen", scope: !126, file: !14, line: 76, type: !39)
!129 = !DILocation(line: 76, column: 19, scope: !126)
!130 = !DILocalVariable(name: "dest", scope: !126, file: !14, line: 77, type: !48)
!131 = !DILocation(line: 77, column: 14, scope: !126)
!132 = !DILocation(line: 78, column: 9, scope: !126)
!133 = !DILocation(line: 79, column: 9, scope: !126)
!134 = !DILocation(line: 79, column: 21, scope: !126)
!135 = !DILocation(line: 80, column: 26, scope: !126)
!136 = !DILocation(line: 80, column: 19, scope: !126)
!137 = !DILocation(line: 80, column: 17, scope: !126)
!138 = !DILocation(line: 83, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !126, file: !14, line: 83, column: 9)
!140 = !DILocation(line: 83, column: 14, scope: !139)
!141 = !DILocation(line: 83, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !14, line: 83, column: 9)
!143 = !DILocation(line: 83, column: 25, scope: !142)
!144 = !DILocation(line: 83, column: 23, scope: !142)
!145 = !DILocation(line: 83, column: 9, scope: !139)
!146 = !DILocation(line: 85, column: 23, scope: !147)
!147 = distinct !DILexicalBlock(scope: !142, file: !14, line: 84, column: 9)
!148 = !DILocation(line: 85, column: 28, scope: !147)
!149 = !DILocation(line: 85, column: 18, scope: !147)
!150 = !DILocation(line: 85, column: 13, scope: !147)
!151 = !DILocation(line: 85, column: 21, scope: !147)
!152 = !DILocation(line: 86, column: 9, scope: !147)
!153 = !DILocation(line: 83, column: 35, scope: !142)
!154 = !DILocation(line: 83, column: 9, scope: !142)
!155 = distinct !{!155, !145, !156, !77}
!156 = !DILocation(line: 86, column: 9, scope: !139)
!157 = !DILocation(line: 87, column: 9, scope: !126)
!158 = !DILocation(line: 87, column: 21, scope: !126)
!159 = !DILocation(line: 88, column: 19, scope: !126)
!160 = !DILocation(line: 88, column: 9, scope: !126)
!161 = !DILocation(line: 90, column: 1, scope: !105)
